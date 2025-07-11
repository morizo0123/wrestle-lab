class NewsConstants {
  NewsConstants._();

  // GoogleニュースRSSのベースURL
  static const String baseRssUrl = 'https://news.google.com/rss/search?q=';
  static const String rssParams = '&hl=ja&gl=JP&ceid=JP:ja';

  // プロレス関連キーワード
  static const List<String> wrestlingKeywords = [
    '新日本プロレス',
    'プロレスリング・ノア',
    'スターダム',
  ];

  // UI表示用
  static const String allCategoryLabel = '全て';

  // カテゴリ定義
  static const String allCategory = 'All';
  static const List<String> categories = [
    allCategory,
    '新日本プロレス',
    'プロレスリング・ノア',
    'スターダム',
  ];

  // RSS取得設定
  static const String rssLanguage = 'ja';
  static const String rssCountry = 'JP';
  static const int newsItemsPerPage = 50;
  static const String rssDateFormat = 'EEE, dd MMM yyyy HH:mm:ss zzz';
  static const String rssDateLocale = 'en_US';

  // キャッシュ設定
  static const Duration cacheExpiration = Duration(seconds: 30);
  static const String cacheKey = 'wrestling_news_cache';
}
