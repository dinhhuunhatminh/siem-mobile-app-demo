// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboards_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Chỉ đọc + hiển thị — không có bộ lọc/tương tác nào làm đổi state như
/// AlertsController, nên FutureProvider đơn giản là đủ, không cần
/// AsyncNotifier riêng.

@ProviderFor(dashboardsSummary)
final dashboardsSummaryProvider = DashboardsSummaryProvider._();

/// Chỉ đọc + hiển thị — không có bộ lọc/tương tác nào làm đổi state như
/// AlertsController, nên FutureProvider đơn giản là đủ, không cần
/// AsyncNotifier riêng.

final class DashboardsSummaryProvider
    extends
        $FunctionalProvider<
          AsyncValue<DashboardSummary>,
          DashboardSummary,
          FutureOr<DashboardSummary>
        >
    with $FutureModifier<DashboardSummary>, $FutureProvider<DashboardSummary> {
  /// Chỉ đọc + hiển thị — không có bộ lọc/tương tác nào làm đổi state như
  /// AlertsController, nên FutureProvider đơn giản là đủ, không cần
  /// AsyncNotifier riêng.
  DashboardsSummaryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashboardsSummaryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardsSummaryHash();

  @$internal
  @override
  $FutureProviderElement<DashboardSummary> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<DashboardSummary> create(Ref ref) {
    return dashboardsSummary(ref);
  }
}

String _$dashboardsSummaryHash() => r'ee719ad832c7efc7e38881b4b108f495e443a8f0';
