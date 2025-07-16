import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:wrestle_lab/features/youtube/models/youtube_video.dart';
import 'package:wrestle_lab/features/youtube/repositories/favorite_repository.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final SupabaseClient _client;

  FavoriteRepositoryImpl({SupabaseClient? client})
    : _client = client ?? Supabase.instance.client;

  @override
  Future<void> addFavorite(YoutubeVideo video) async {
    try {
      await _client.from('favorite_videos').insert({
        'video_id': video.videoId,
        'title': video.title,
        'url': video.url,
        'thumbnail': video.thumbnail,
        'channel_title': video.channelTitle,
        'published_at': video.publishedAt.toIso8601String(),
      });
    } on PostgrestException catch (e) {
      print('=== PostgrestException ===');
      print('Code: ${e.code}');
      print('Message: ${e.message}');
      print('Details: ${e.details}');
      print('Hint: ${e.hint}');
      throw Exception('Supabaseエラー: ${e.message}');
    } catch (e) {
      print('=== 一般的なエラー ===');
      print('Error type: ${e.runtimeType}');
      print('Error message: $e');
      throw Exception('一般的なエラー: $e');
    }
  }

  @override
  Future<void> removeFavorite(String videoId) async {
    try {
      await _client.from('favorite_videos').delete().eq('video_id', videoId);
    } catch (e) {
      throw Exception('お気に入り削除に失敗しました: $e');
    }
  }

  @override
  Future<List<YoutubeVideo>> getFavorites() async {
    try {
      final response = await _client
          .from('favorite_videos')
          .select()
          .order('created_at', ascending: false);

      return response
          .map<YoutubeVideo>((json) => YoutubeVideo.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('お気に入り取得に失敗しました: $e');
    }
  }

  @override
  Future<bool> isFavorite(String videoId) async {
    try {
      final response =
          await _client
              .from('favorite_videos')
              .select('video_id')
              .eq('video_id', videoId)
              .maybeSingle();

      return response != null;
    } catch (e) {
      return false;
    }
  }
}
