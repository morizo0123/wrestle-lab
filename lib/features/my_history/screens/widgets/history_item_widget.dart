import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:wrestle_lab/features/my_history/models/history.dart';
import 'package:wrestle_lab/routes/route_path_name.dart';

class HistoryItemWidget extends StatelessWidget {
  final History history;

  const HistoryItemWidget({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(RoutePathName.myHistoryDetail, extra: history);
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // サムネイル
            _buildThumbnail(),
            const SizedBox(width: 12),
            // 日付・団体・興行
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildEventDate(),
                  const SizedBox(height: 2),
                  _buildOrganization(),
                  const SizedBox(height: 4),
                  _buildEventName(),
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
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child:
            history.photoUrl != null
                ? CachedNetworkImage(
                  imageUrl: history.photoUrl!,
                  fit: BoxFit.cover,
                  placeholder:
                      (context, url) => Container(
                        color: Colors.grey[300],
                        child: Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                  errorWidget: (context, url, error) => _buildDefaultImage(),
                )
                : _buildDefaultImage(),
      ),
    );
  }

  Widget _buildDefaultImage() {
    return Image.asset('assets/images/logo.png', fit: BoxFit.cover);
  }

  Widget _buildEventDate() {
    final formattedDate = DateFormat('yyyy年MM月dd日').format(history.eventDate);
    return Text(
      formattedDate,
      style: TextStyle(
        fontSize: 14,
        color: Colors.grey[600],
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildOrganization() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue[200]!),
      ),
      child: Text(
        history.organization,
        style: TextStyle(
          fontSize: 12,
          color: Colors.blue[700],
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildEventName() {
    return Text(
      history.eventName,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
