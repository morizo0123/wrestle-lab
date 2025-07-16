import 'package:flutter_dotenv/flutter_dotenv.dart';

class YoutubeConstants {
  YoutubeConstants._();

  // 環境変数からAPIキー取得
  static String get apiKey => dotenv.env['YOUTUBE_API_KEY'] ?? '';

  // YouTube Data API v3のベースURL
  static const String baseUrl = 'https://www.googleapis.com/youtube/v3';

  // エンドポイント
  static const String searchEndpoint = '/search';

  // APIパラメータ
  static const String part = 'snippet';
  static const String type = 'video';
  static const int maxResults = 50;

  // プロレス関連キーワード（検索用）
  static const List<String> wrestlingKeywords = [
    '新日本プロレス',
    'プロレスリング・ノア',
    'スターダム',
  ];

  // カテゴリ定義（タブ表示用）
  static const String defaultCategory = '新日本プロレス';
  static const List<String> categories = [
    defaultCategory,
    'プロレスリング・ノア',
    'スターダム',
  ];

  // キャッシュ設定
  static const Duration cacheDuration = Duration(hours: 6);
}
