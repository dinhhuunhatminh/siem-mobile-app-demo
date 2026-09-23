// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboards_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dashboardsRepository)
final dashboardsRepositoryProvider = DashboardsRepositoryProvider._();

final class DashboardsRepositoryProvider
    extends
        $FunctionalProvider<
          DashboardsRepository,
          DashboardsRepository,
          DashboardsRepository
        >
    with $Provider<DashboardsRepository> {
  DashboardsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashboardsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardsRepositoryHash();

  @$internal
  @override
  $ProviderElement<DashboardsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DashboardsRepository create(Ref ref) {
    return dashboardsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DashboardsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DashboardsRepository>(value),
    );
  }
}

String _$dashboardsRepositoryHash() =>
    r'4b18e7672f0013a0bdaba7f825537fefbfb6c992';
