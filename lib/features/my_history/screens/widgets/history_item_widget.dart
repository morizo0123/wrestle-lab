import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wrestle_lab/features/my_history/models/history.dart';

class HistoryItemWidget extends StatelessWidget {
  final History history;

  const HistoryItemWidget({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
                  const SizedBox(height: 4),
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
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[300],
      ),
      child: ClipRRect(borderRadius: BorderRadius.circular(8)),
    );
  }

  Widget _buildEventDate() {
    return Text('event date');
  }

  Widget _buildOrganization() {
    return Text('団体名');
  }

  Widget _buildEventName() {
    return Text('興行名');
  }
}
