import 'package:wrestle_lab/features/youtube/models/youtube_video.dart';

abstract class FavoriteRepository {
  Future<void> addFavorite(YoutubeVideo video);
  Future<void> removeFavorite(String videoId);
  Future<List<YoutubeVideo>> getFavorites();
  Future<bool> isFavorite(String videoId);
}