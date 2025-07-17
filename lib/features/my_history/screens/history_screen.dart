import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wrestle_lab/features/my_history/screens/widgets/history_item_widget.dart';
import 'package:wrestle_lab/features/my_history/viewmodels/history_viewmodel.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key});

  @override
  ConsumerState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(historyViewModelProvider.notifier).loadHistories();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewState = ref.watch(historyViewModelProvider);
    final viewModel = ref.read(historyViewModelProvider.notifier);

    return _buildBody(viewState, viewModel);
  }

  Widget _buildBody(HistoryViewState viewState, HistoryViewModel viewModel) {
    if (viewState.isLoading) {
      return Center(child: const CircularProgressIndicator());
    }

    if (viewState.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'エラーが発生しました',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(viewState.error!),
            ElevatedButton(
              onPressed: () => viewModel.loadHistories(),
              child: const Text('再試行'),
            ),
          ],
        ),
      );
    }

    if (viewState.histories.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.history, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              '履歴がありません',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '観戦履歴を追加して記録を残しましょう',
              style: TextStyle(fontSize: 14, color: Colors.grey[500]),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      itemCount: viewState.histories.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final history = viewState.histories[index];
        return HistoryItemWidget(
          history: history,
        );
      },
    );
  }
}
