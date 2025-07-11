import 'package:wrestle_lab/features/news/constants.dart';
import 'package:wrestle_lab/features/news/models/news_item.dart';
import 'package:wrestle_lab/features/news/repositories/news_repository.dart';
import 'package:wrestle_lab/features/news/services/news_service.dart';

class NewsServiceImpl implements NewsService {
  final NewsRepository _repository;

  NewsServiceImpl(this._repository);

  @override
  Future<List<NewsItem>> getAllWrestlingNews({
    int offset = 0,
    int limit = NewsConstants.newsItemsPerPage,
  }) async {
    List<NewsItem> allNews = [];

    for (String keyword in NewsConstants.wrestlingKeywords) {
      try {
        final news = await _repository.getNewsItem(keyword: keyword);
        allNews.addAll(news);
      } catch (e) {
        print('キーワード「$keyword」のエラー: $e');
      }
    }

    final processedNews = _processNews(allNews);

    // オフセットとリミットを適用
    final startIndex = offset;
    final endIndex = (offset + limit).clamp(0, processedNews.length);

    if (startIndex >= processedNews.length) {
      return []; // これ以上データなし
    }

    // 指定範囲を切り出し
    return processedNews.sublist(startIndex, endIndex);
  }

  @override
  Future<List<NewsItem>> getNewsByKeyword(
    String keyword, {
    int offset = 0,
    int limit = NewsConstants.newsItemsPerPage,
  }) async {
    try {
      final news = await _repository.getNewsItem(keyword: keyword);
      final processedNews = _processNews(news);

      // オフセットとリミットを適用
      final startIndex = offset;
      final endIndex = (offset + limit).clamp(0, processedNews.length);

      if (startIndex >= processedNews.length) {
        return []; // これ以上データなし
      }

      return processedNews.sublist(startIndex, endIndex);
    } catch (e) {
      print('キーワード「$keyword」のエラー: $e');
      rethrow; // ViewModelでエラーハンドリング
    }
  }

  List<NewsItem> _processNews(List<NewsItem> newsList) {
    // 重複除去（URLで判定）
    final Map<String, NewsItem> uniqueNews = {};
    for (NewsItem item in newsList) {
      uniqueNews[item.link] = item;
    }

    // 新しい順でソート
    final sortedNews =
        uniqueNews.values.toList()
          ..sort((a, b) => b.pubDate.compareTo(a.pubDate));

    return sortedNews;
  }
}
