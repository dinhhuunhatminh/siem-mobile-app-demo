// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Instance Dio duy nhất dùng chung toàn app, nơi khác lấy qua ref.watch,
/// không tự khởi tạo Dio() riêng ở bất kỳ đâu khác.

@ProviderFor(apiClient)
final apiClientProvider = ApiClientProvider._();

/// Instance Dio duy nhất dùng chung toàn app, nơi khác lấy qua ref.watch,
/// không tự khởi tạo Dio() riêng ở bất kỳ đâu khác.

final class ApiClientProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  /// Instance Dio duy nhất dùng chung toàn app, nơi khác lấy qua ref.watch,
  /// không tự khởi tạo Dio() riêng ở bất kỳ đâu khác.
  ApiClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'apiClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$apiClientHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return apiClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$apiClientHash() => r'364fc82add35983e3ed32f4dc34bf6f3590f68c0';
