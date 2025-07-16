import 'package:wrestle_lab/features/youtube/models/youtube_video.dart';

abstract class FavoriteService {
  Future<void> addToFavorites(YoutubeVideo video);
  Future<void> removeFromFavorites(String videoId);
  Future<List<YoutubeVideo>> getAllFavorites();
  Future<bool> isFavorite(String videoId);
}