import 'package:wrestle_lab/features/news/constants.dart';
import 'package:wrestle_lab/features/news/models/news_item.dart';

abstract class NewsService {
  Future<List<NewsItem>> getAllWrestlingNews({
    int offset = 0,
    int limit = NewsConstants.newsItemsPerPage,
  });

  Future<List<NewsItem>> getNewsByKeyword(
    String keyword, {
    int offset = 0,
    int limit = NewsConstants.newsItemsPerPage,
  });
}
