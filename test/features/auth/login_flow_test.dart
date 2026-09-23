import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:v2report_app/app/app.dart';
import 'package:v2report_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:v2report_app/features/auth/data/models/login_response.dart';
import 'package:v2report_app/shared/widgets/buttons/app_button.dart';
import 'package:v2report_app/shared/widgets/inputs/app_text_field.dart';

/// Datasource giả lập backend — widget test không nên phụ thuộc network
/// thật (Flutter test framework cũng tự chặn HttpClient thật để tránh
/// test không ổn định do mạng). Chỉ mock đúng ở biên network, các lớp
/// phía trên (repository, controller, UI) vẫn chạy code thật.
class _FakeAuthRemoteDatasource extends AuthRemoteDatasource {
  _FakeAuthRemoteDatasource() : super(Dio());

  @override
  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    if (password != 'password123') {
      throw DioException(
        requestOptions: RequestOptions(path: '/auth/login'),
        response: Response(
          requestOptions: RequestOptions(path: '/auth/login'),
          statusCode: 401,
          data: {'message': 'Sai email hoặc mật khẩu'},
        ),
        type: DioExceptionType.badResponse,
      );
    }

    return LoginResponse.fromJson({
      'accessToken': 'fake-access-token',
      'refreshToken': 'fake-refresh-token',
      'user': {'id': 'u-001', 'email': email, 'name': 'Người dùng thử nghiệm'},
    });
  }
}

void main() {
  const secureStorageChannel = MethodChannel(
    'plugins.it_nomads.com/flutter_secure_storage',
  );

  final storedValues = <String, String>{};

  setUp(() {
    storedValues.clear();
    TestWidgetsFlutterBinding.ensureInitialized()
        .defaultBinaryMessenger
        .setMockMethodCallHandler(secureStorageChannel, (call) async {
      switch (call.method) {
        case 'read':
          return storedValues[call.arguments['key']];
        case 'write':
          storedValues[call.arguments['key'] as String] =
              call.arguments['value'] as String;
          return null;
        case 'delete':
          storedValues.remove(call.arguments['key']);
          return null;
        default:
          return null;
      }
    });
  });

  tearDown(() {
    TestWidgetsFlutterBinding.ensureInitialized()
        .defaultBinaryMessenger
        .setMockMethodCallHandler(secureStorageChannel, null);
  });

  ProviderScope buildApp() {
    return ProviderScope(
      overrides: [
        authRemoteDatasourceProvider.overrideWith(
          (ref) => _FakeAuthRemoteDatasource(),
        ),
      ],
      child: const App(),
    );
  }

  testWidgets('login voi dung password123 thi chuyen sang Dashboard', (
    tester,
  ) async {
    await tester.pumpWidget(buildApp());
    await tester.pumpAndSettle();

    expect(find.text('Đăng nhập'), findsWidgets);

    await tester.enterText(
      find.widgetWithText(AppTextField, 'Email'),
      'test@example.com',
    );
    await tester.enterText(
      find.widgetWithText(AppTextField, 'Mật khẩu'),
      'password123',
    );

    await tester.tap(find.widgetWithText(AppButton, 'Đăng nhập'));
    await tester.pumpAndSettle();

    expect(find.textContaining('Xin chào'), findsOneWidget);
  });

  testWidgets('login voi sai password thi bao loi va khong chuyen man', (
    tester,
  ) async {
    await tester.pumpWidget(buildApp());
    await tester.pumpAndSettle();

    await tester.enterText(
      find.widgetWithText(AppTextField, 'Email'),
      'test@example.com',
    );
    await tester.enterText(
      find.widgetWithText(AppTextField, 'Mật khẩu'),
      'sai-mat-khau',
    );

    await tester.tap(find.widgetWithText(AppButton, 'Đăng nhập'));
    await tester.pumpAndSettle();

    expect(find.textContaining('Sai email hoặc mật khẩu'), findsOneWidget);
    expect(find.text('Đăng nhập'), findsWidgets);
  });
}
