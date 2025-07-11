import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wrestle_lab/features/news/screens/widgets/news_item_widget.dart';
import 'package:wrestle_lab/features/news/viewmodels/news_viewmodel.dart';
import 'package:wrestle_lab/features/news/constants.dart';

class NewsScreen extends ConsumerStatefulWidget {
  const NewsScreen({super.key});

  @override
  ConsumerState createState() => _NewsScreenState();
}

class _NewsScreenState extends ConsumerState<NewsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(newsViewModelProvider.notifier).loadAllWrestlingNews();
      ref
          .read(newsViewModelProvider.notifier)
          .selectCategory(NewsConstants.allCategory);
    });
  }

  void _onScroll() {
    // 「現在位置」が「最大スクロール位置」と同じ = 一番下まで到達した
    const threshold = 100;
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - threshold) {
      ref.read(newsViewModelProvider.notifier).loadMoreNews();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewState = ref.watch(newsViewModelProvider);
    final viewModel = ref.read(newsViewModelProvider.notifier);

    return _buildBody(viewState, viewModel);
  }

  Widget _buildBody(NewsViewState viewState, NewsViewModel viewModel) {
    return Column(
      children: [
        // タブバー
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
          ),
          child: Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: NewsConstants.categories.length,
              itemBuilder: (context, index) {
                final category = NewsConstants.categories[index];
                final isSelected = viewState.selectedCategory == category;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: InkWell(
                    onTap: () => viewModel.selectCategory(category),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        border:
                            isSelected
                                ? const Border(
                                  bottom: BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                )
                                : null,
                      ),
                      child: Center(
                        child: Text(
                          category,
                          style: TextStyle(
                            color: isSelected ? Colors.black : Colors.grey,
                            fontWeight:
                                isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        // ニュースリスト
        Expanded(child: _buildNewsList(viewState, viewModel)),
      ],
    );
  }

  Widget _buildNewsList(NewsViewState viewState, NewsViewModel viewModel) {
    if (viewState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (viewState.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(viewState.error!),
            ElevatedButton(
              onPressed: () => viewModel.loadAllWrestlingNews(),
              child: const Text('再試行'),
            ),
          ],
        ),
      );
    }

    if (viewState.news.isEmpty) {
      return const Center(child: Text('ニュースがありません'));
    }

    return ListView.builder(
      controller: _scrollController,
      itemCount: viewState.news.length,
      itemBuilder: (context, index) {
        return NewsItemWidget(newsItem: viewState.news[index]);
      },
    );
  }
}
