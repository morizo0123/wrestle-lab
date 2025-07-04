import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_item.freezed.dart';
part 'news_item.g.dart';

@freezed
abstract class NewsItem with _$NewsItem {
  const factory NewsItem({
    required String title,
    required String description,
    required String link,
    required DateTime pubDate,
    required String source,
    String? imageUrl,
  }) = _NewsItem;

  factory NewsItem.fromJson(Map<String, dynamic> json) =>
      _$NewsItemFromJson(json);
}
