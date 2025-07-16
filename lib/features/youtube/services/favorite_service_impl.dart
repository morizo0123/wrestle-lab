import 'package:wrestle_lab/features/youtube/models/youtube_video.dart';
import 'package:wrestle_lab/features/youtube/repositories/favorite_repository.dart';
import 'package:wrestle_lab/features/youtube/services/favorite_service.dart';

class FavoriteServiceImpl implements FavoriteService {
  final FavoriteRepository _repository;

  FavoriteServiceImpl(this._repository);

  @override
  Future<void> addToFavorites(YoutubeVideo video) async {
    return _repository.addFavorite(video);
  }

  @override
  Future<void> removeFromFavorites(String videoId) async {
    return _repository.removeFavorite(videoId);
  }

  @override
  Future<List<YoutubeVideo>> getAllFavorites() async {
    return _repository.getFavorites();
  }

  @override
  Future<bool> isFavorite(String videoId) async {
    return _repository.isFavorite(videoId);
  }
}