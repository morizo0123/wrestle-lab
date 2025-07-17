import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wrestle_lab/features/my_history/viewmodels/history_viewmodel.dart';

class HistoryCreateScreen extends ConsumerStatefulWidget {
  const HistoryCreateScreen({super.key});

  @override
  ConsumerState createState() => _HistoryCreateScreenState();
}

class _HistoryCreateScreenState extends ConsumerState<HistoryCreateScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.read(historyViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '観戦記録作成',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),

      // body: _buildHistoryCreate(),
    );
  }

  // Widget _buildHistoryCreate() {
  //
  // }
}
