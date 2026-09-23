// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Sở hữu AuthState toàn app. features/auth/presentation chỉ ref.watch
/// provider này chứ không tự giữ state đăng nhập riêng.

@ProviderFor(AuthController)
final authControllerProvider = AuthControllerProvider._();

/// Sở hữu AuthState toàn app. features/auth/presentation chỉ ref.watch
/// provider này chứ không tự giữ state đăng nhập riêng.
final class AuthControllerProvider
    extends $NotifierProvider<AuthController, AuthState> {
  /// Sở hữu AuthState toàn app. features/auth/presentation chỉ ref.watch
  /// provider này chứ không tự giữ state đăng nhập riêng.
  AuthControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authControllerHash();

  @$internal
  @override
  AuthController create() => AuthController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthState>(value),
    );
  }
}

String _$authControllerHash() => r'1ee4ad3c8de90fef8d437f59e9a18b0b0b1d7ef8';

/// Sở hữu AuthState toàn app. features/auth/presentation chỉ ref.watch
/// provider này chứ không tự giữ state đăng nhập riêng.

abstract class _$AuthController extends $Notifier<AuthState> {
  AuthState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AuthState, AuthState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AuthState, AuthState>,
              AuthState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
