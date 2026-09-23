import 'package:flutter/material.dart';

import '../states/empty_state_view.dart';
import '../states/error_state_view.dart';
import '../states/loading_indicator.dart';
import 'app_scaffold.dart';

/// Trạng thái của 1 danh sách — thay cho việc mỗi feature tự viết
/// if/else (isLoading, errorMessage, data.isEmpty) lặp lại. sealed để
/// AppListScaffold xử lý đủ 4 case, không sót trường hợp nào.
sealed class ListState<T> {
  const ListState();
}

class ListLoading<T> extends ListState<T> {
  const ListLoading();
}

class ListError<T> extends ListState<T> {
  const ListError(this.message, {this.onRetry});
  final String message;
  final VoidCallback? onRetry;
}

class ListEmpty<T> extends ListState<T> {
  const ListEmpty(this.message);
  final String message;
}

class ListData<T> extends ListState<T> {
  const ListData(this.items);
  final List<T> items;
}

/// Biến thể AppScaffold cho màn hình dạng danh sách — tự chọn đúng
/// widget (loading/error/empty/data) theo ListState, feature chỉ cần
/// cung cấp state hiện tại + itemBuilder, không tự viết lại switch mỗi lần.
class AppListScaffold<T> extends StatelessWidget {
  const AppListScaffold({
    super.key,
    required this.title,
    required this.state,
    required this.itemBuilder,
    this.actions,
  });

  final String title;
  final ListState<T> state;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: title,
      actions: actions,
      padHorizontal: false,
      body: switch (state) {
        ListLoading() => const LoadingIndicator(),
        ListError(:final message, :final onRetry) =>
          ErrorStateView(message: message, onRetry: onRetry),
        ListEmpty(:final message) => EmptyStateView(message: message),
        ListData(:final items) => ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) => itemBuilder(context, items[index]),
          ),
      },
    );
  }
}
