// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboards_remote_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dashboardsRemoteDatasource)
final dashboardsRemoteDatasourceProvider =
    DashboardsRemoteDatasourceProvider._();

final class DashboardsRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          DashboardsRemoteDatasource,
          DashboardsRemoteDatasource,
          DashboardsRemoteDatasource
        >
    with $Provider<DashboardsRemoteDatasource> {
  DashboardsRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashboardsRemoteDatasourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardsRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<DashboardsRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DashboardsRemoteDatasource create(Ref ref) {
    return dashboardsRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DashboardsRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DashboardsRemoteDatasource>(value),
    );
  }
}

String _$dashboardsRemoteDatasourceHash() =>
    r'caf268380db1445f4ed146c94a61dc888f0199f8';
