import 'package:flutter/material.dart';
import 'package:wrestle_lab/features/youtube/models/youtube_video.dart';

class YoutubeItemWidget extends StatelessWidget {
  final YoutubeVideo video;
  final VoidCallback? onTap;
  final VoidCallback? onFavoritePressed;
  final VoidCallback? onSharePressed;

  const YoutubeItemWidget({
    super.key,
    required this.video,
    this.onTap,
    this.onFavoritePressed,
    this.onSharePressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // サムネイル
            _buildThumbnail(),
            const SizedBox(width: 12),
            // タイトル・詳細・ボタン
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(),
                  const SizedBox(height: 4),
                  _buildChannelTitle(),
                  const SizedBox(height: 4),
                  _buildPublishedAt(),
                  const SizedBox(height: 8),
                  _buildActionButtons(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThumbnail() {
    return Container(
      width: 120,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[300],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          video.thumbnail,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[300],
              child: const Icon(Icons.play_circle_outline, size: 40),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      video.title,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildChannelTitle() {
    return Text(
      video.channelTitle,
      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
    );
  }

  Widget _buildPublishedAt() {
    return Text(
      _formatDate(video.publishedAt),
      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 0) {
      return '${difference.inDays}日前';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}時間前';
    } else {
      return '${difference.inMinutes}分前';
    }
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        // お気に入りボタン
        GestureDetector(
          onTap: onFavoritePressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.favorite_border, size: 20, color: Colors.grey[600]),
              const SizedBox(width: 4),
              Text(
                'お気に入り',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        // シェアボタン
        GestureDetector(
          onTap: onSharePressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.share, size: 20, color: Colors.grey[600]),
              const SizedBox(width: 4),
              Text(
                'シェア',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
