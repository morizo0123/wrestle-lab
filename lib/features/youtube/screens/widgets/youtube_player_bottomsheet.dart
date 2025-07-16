import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:wrestle_lab/features/youtube/models/youtube_video.dart';
import 'package:wrestle_lab/features/youtube/viewmodels/youtube_viewmodel.dart';

class YoutubePlayerBottomsheet extends ConsumerStatefulWidget {
  final YoutubeVideo video;
  final bool isFavorite;

  const YoutubePlayerBottomsheet({
    super.key,
    required this.video,
    this.isFavorite = false,
  });

  @override
  ConsumerState createState() => _YoutubePlayerBottomsheetState();
}

class _YoutubePlayerBottomsheetState
    extends ConsumerState<YoutubePlayerBottomsheet> {
  late WebViewController _controller;
  late bool _currentFavoriteStatus;

  @override
  void initState() {
    super.initState();
    _currentFavoriteStatus = widget.isFavorite;
    _initializeWebView();
  }

  void _initializeWebView() {
    _controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse(_getEmbedUrl()));
  }

  String _getEmbedUrl() {
    return 'https://www.youtube.com/embed/${widget.video.videoId}?autoplay=1&modestbranding=1&rel=0';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        children: [
          // ハンドル
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // 動画プレイヤー
          Container(
            height: 200,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: WebViewWidget(controller: _controller),
            ),
          ),
          // 動画情報
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.video.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.video.channelTitle,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 16),
                  // アクションボタン
                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => _onFavoritePressed(),
                        icon: Icon(
                          _currentFavoriteStatus
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color:
                              _currentFavoriteStatus
                                  ? Colors.pink
                                  : Colors.grey[600],
                        ),
                        label: Text(
                          _currentFavoriteStatus ? 'お気に入り済み' : 'お気に入り',
                          style: TextStyle(
                            color:
                                _currentFavoriteStatus
                                    ? Colors.pink
                                    : Colors.grey[600],
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton.icon(
                        onPressed: () => _onSharePressed(),
                        icon: const Icon(Icons.share),
                        label: const Text('シェア'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onFavoritePressed() {
    // お気に入り状態を即座に更新（UI反映）
    setState(() {
      _currentFavoriteStatus = !_currentFavoriteStatus;
    });

    // ViewModelのお気に入り処理を実行
    ref.read(youtubeViewModelProvider.notifier).toggleFavorite(widget.video);

    // お気に入り削除後、一覧を更新
    Future.delayed(const Duration(milliseconds: 500), () {
      ref.read(youtubeViewModelProvider.notifier).loadFavoriteVideos();
    });
  }

  void _onSharePressed() {
    ref.read(youtubeViewModelProvider.notifier).shareVideo(widget.video);
  }
}
