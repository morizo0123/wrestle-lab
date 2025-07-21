import 'package:freezed_annotation/freezed_annotation.dart';

part 'history.freezed.dart';
part 'history.g.dart';

@freezed
abstract class History with _$History {
  const factory History({
    int? id,
    @JsonKey(name: 'event_date') required DateTime eventDate,
    required String organization,
    @JsonKey(name: 'event_name') required String eventName,
    required String venue,
    String? review,
    @JsonKey(name: 'photo_url') String? photoUrl,
  }) = _History;

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);
}
