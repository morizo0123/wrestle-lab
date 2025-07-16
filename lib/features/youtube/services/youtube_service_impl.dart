import 'package:wrestle_lab/features/youtube/constants.dart';
import 'package:wrestle_lab/features/youtube/models/youtube_video.dart';
import 'package:wrestle_lab/features/youtube/repositories/youtube_repository.dart';
import 'package:wrestle_lab/features/youtube/services/youtube_service.dart';

class YoutubeServiceImpl implements YoutubeService {
  final YoutubeRepository _repository;

  YoutubeServiceImpl(this._repository);

  /**
   * キャッシュ用のMapを定義
   * String: キーワード（例：「新日本プロレス」）
   * Record型: 動画リスト + 保存した日時をセット
   * '新日本プロレス': (videos: [動画1, 動画2, ...], cachedAt: 2025-07-14 10:30:00),
   */
  final Map<String, ({List<YoutubeVideo> videos, DateTime cachedAt})> _cache =
      {};

  @override
  Future<({List<YoutubeVideo> videos, String? nextPageToken})>
  getVideosByKeyword({required String keyword, String? nextPageToken}) async {
    // nextPageTokenがある場合はキャッシュを使わない（追加読み込み）
    if (nextPageToken != null) {
      return await _repository.getVideos(
        keyword: keyword,
        nextPageToken: nextPageToken,
      );
    }

    // キャッシュチェック
    if (_cache.containsKey(keyword)) {
      final cached = _cache[keyword]!;
      final now = DateTime.now();

      // キャッシュが有効期限内か確認
      if (now.difference(cached.cachedAt) < YoutubeConstants.cacheDuration) {
        print('✅ キャッシュから取得: $keyword');
        return (videos: cached.videos, nextPageToken: null);
      }
    }

    // API呼び出し + キャッシュ保存
    print('🌐 API呼び出し: $keyword');
    try {
      final result = await _repository.getVideos(keyword: keyword);

      // キャッシュに保存
      _cache[keyword] = (videos: result.videos, cachedAt: DateTime.now());

      return result;
    } catch (e) {
      print('キーワード「$keyword」のエラー: $e');
      rethrow; // ViewModelでエラーハンドリング
    }
  }
}
