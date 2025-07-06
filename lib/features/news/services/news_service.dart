import 'package:wrestle_lab/features/news/models/news_item.dart';

abstract class NewsService {
  Future<List<NewsItem>> getAllWrestlingNews();
  Future<List<NewsItem>> getNewsByKeyword(String keyword);
}