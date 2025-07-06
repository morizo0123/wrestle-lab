import 'package:wrestle_lab/features/news/constants.dart';
import 'package:wrestle_lab/features/news/models/news_item.dart';
import 'package:wrestle_lab/features/news/repositories/news_repository.dart';
import 'package:wrestle_lab/features/news/services/news_service.dart';

class NewsServiceImpl implements NewsService {
  final NewsRepository _repository;

  NewsServiceImpl(this._repository);

  @override
  Future<List<NewsItem>> getAllWrestlingNews() async {
    List<NewsItem> allNews = [];

    for (String keyword in NewsConstants.wrestlingKeywords) {
      try {
        final news = await _repository.getNewsItem(keyword: keyword);
        allNews.addAll(news);
      } catch (e) {
        print('キーワード「$keyword」のエラー: $e');
      }
    }

    return _processNews(allNews);
  }

  @override
  Future<List<NewsItem>> getNewsByKeyword(String keyword) async {
    try {
      final news = await _repository.getNewsItem(keyword: keyword);
      return _processNews(news);
    } catch (e) {
      print('キーワード「$keyword」のエラー: $e');
      rethrow;  // ViewModelでエラーハンドリング
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
