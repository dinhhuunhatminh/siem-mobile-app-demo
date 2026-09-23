// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alerts_remote_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(alertsRemoteDatasource)
final alertsRemoteDatasourceProvider = AlertsRemoteDatasourceProvider._();

final class AlertsRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          AlertsRemoteDatasource,
          AlertsRemoteDatasource,
          AlertsRemoteDatasource
        >
    with $Provider<AlertsRemoteDatasource> {
  AlertsRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'alertsRemoteDatasourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$alertsRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<AlertsRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AlertsRemoteDatasource create(Ref ref) {
    return alertsRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AlertsRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AlertsRemoteDatasource>(value),
    );
  }
}

String _$alertsRemoteDatasourceHash() =>
    r'6391a2125ace97eccfc1b2d99ef29325efeb7e4a';
