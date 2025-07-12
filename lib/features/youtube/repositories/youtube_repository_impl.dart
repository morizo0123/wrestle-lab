import 'package:dio/dio.dart';
import 'package:wrestle_lab/features/youtube/constants.dart';
import 'package:wrestle_lab/features/youtube/models/youtube_video.dart';
import 'package:wrestle_lab/features/youtube/repositories/youtube_repository.dart';

class YoutubeRepositoryImpl implements YoutubeRepository {
  final Dio _dio;

  YoutubeRepositoryImpl({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<({List<YoutubeVideo> videos, String? nextPageToken})> getVideos({
    required String keyword,
    String? nextPageToken,
  }) async {
    try {
      final url =
          '${YoutubeConstants.baseUrl}${YoutubeConstants.searchEndpoint}';
      final response = await _dio.get(
        url,
        queryParameters: {
          'part': YoutubeConstants.part,
          'q': keyword,
          'type': YoutubeConstants.type,
          'maxResults': YoutubeConstants.maxResults,
          'key': YoutubeConstants.apiKey,
          if (nextPageToken != null) 'pageToken': nextPageToken,
        },
      );

      final videos = _parseVideos(response.data['item']);
      final nextToken = response.data['nextPageToken'] as String?;

      return (videos: videos, nextPageToken: nextToken);
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  // 1つの動画をパース
  YoutubeVideo _parseVideo(Map<String, dynamic> item) {
    return YoutubeVideo(
      id: 0,
      videoId: item['id']['videoId'],
      title: item['snippet']['title'],
      url: 'https://youtube.com/watch?v=${item['id']['videoId']}',
      thumbnail: item['snippet']['thumbnails']['default']['url'],
      channelTitle: item['snippet']['channelTitle'],
      publishedAt: DateTime.parse(item['snippet']['publishedAt']),
    );
  }

  // 複数の動画をパース
  List<YoutubeVideo> _parseVideos(List<dynamic> items) {
    return items.map((item) => _parseVideo(item)).toList();
  }
}
