// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alerts_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Sở hữu danh sách alert gốc + bộ lọc severity đang chọn. UI chỉ đọc
/// `filteredGroups` (đã lọc + group sẵn) và gọi `toggleSeverity`.

@ProviderFor(AlertsController)
final alertsControllerProvider = AlertsControllerProvider._();

/// Sở hữu danh sách alert gốc + bộ lọc severity đang chọn. UI chỉ đọc
/// `filteredGroups` (đã lọc + group sẵn) và gọi `toggleSeverity`.
final class AlertsControllerProvider
    extends $AsyncNotifierProvider<AlertsController, Set<AlertSeverity>> {
  /// Sở hữu danh sách alert gốc + bộ lọc severity đang chọn. UI chỉ đọc
  /// `filteredGroups` (đã lọc + group sẵn) và gọi `toggleSeverity`.
  AlertsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'alertsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$alertsControllerHash();

  @$internal
  @override
  AlertsController create() => AlertsController();
}

String _$alertsControllerHash() => r'5776c18112c5ea24c4f0e0f5d2bc86a5d7136a04';

/// Sở hữu danh sách alert gốc + bộ lọc severity đang chọn. UI chỉ đọc
/// `filteredGroups` (đã lọc + group sẵn) và gọi `toggleSeverity`.

abstract class _$AlertsController extends $AsyncNotifier<Set<AlertSeverity>> {
  FutureOr<Set<AlertSeverity>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<Set<AlertSeverity>>, Set<AlertSeverity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Set<AlertSeverity>>, Set<AlertSeverity>>,
              AsyncValue<Set<AlertSeverity>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
