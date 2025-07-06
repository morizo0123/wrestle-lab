import 'package:wrestle_lab/features/news/models/news_item.dart';

abstract class NewsRepository {
  Future<List<NewsItem>> getNewsItem({required String keyword});
}