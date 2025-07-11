import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wrestle_lab/features/news/models/news_item.dart';
import 'package:wrestle_lab/routes/route_path_name.dart';

class NewsItemWidget extends StatelessWidget {
  final NewsItem newsItem;

  const NewsItemWidget({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(RoutePathName.newsWeb, extra: newsItem);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newsItem.source,
                    style: const TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    newsItem.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${_formatDate(newsItem.pubDate)} - ${_stripHtmlTags(newsItem.description)}',
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.month}月${date.day}日';
  }

  String _stripHtmlTags(String htmlString) {
    // r''：Raw文字列（エスケープ不要）
    // <：HTMLタグの開始文字「<」
    // [^>]：「>」以外の任意の文字
    // *：直前の文字が0回以上繰り返し
    // >：HTMLタグの終了文字「>」
    return htmlString.replaceAll(RegExp(r'<[^>]*>'), '');
  }
}
