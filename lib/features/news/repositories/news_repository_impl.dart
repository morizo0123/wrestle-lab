import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:xml/xml.dart';
import 'package:wrestle_lab/features/news/models/news_item.dart';
import 'package:wrestle_lab/features/news/repositories/news_repository.dart';
import 'package:wrestle_lab/features/news/constants.dart';

class NewsRepositoryImpl implements NewsRepository {
  final Dio _dio;

  NewsRepositoryImpl({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<List<NewsItem>> getNewsItem({required String keyword}) async {
    try {
      final url = '${NewsConstants.baseRssUrl}$keyword${NewsConstants.rssParams}';
      final response = await _dio.get(url);

      // XMLドキュメントをパース
      final document = XmlDocument.parse(response.data);

      // RSS itemタグを取得
      final items = document.findAllElements('item');

      // 各itemをNewsItemに変換
      final newsList = items.map((item) => _parseItem(item)).toList();

      return newsList;
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  NewsItem _parseItem(XmlElement item) {
    return NewsItem(
      title: item.findElements('title').first.innerText,
      description: item.findElements('description').first.innerText,
      link: item.findElements('link').first.innerText,
      pubDate: _parseDate(item.findElements('pubDate').first.innerText),
      source: 'Google News',
    );
  }

  DateTime _parseDate(String dateString) {
    try {
      // RFC2822形式をパース
      final formatter = DateFormat(
        NewsConstants.rssDateFormat,
        NewsConstants.rssDateLocale,
      );
      return formatter.parse(dateString);
    } catch (e) {
      // フォールバック：現在時刻を返す
      print('日付パースエラー: $dateString');
      return DateTime.now();
    }
  }
}
