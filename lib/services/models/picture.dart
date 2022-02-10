import 'package:json_annotation/json_annotation.dart';
part 'picture.g.dart';

@JsonSerializable()
class Picture {
  @JsonKey(name: 'date')
  DateTime date;
  @JsonKey(name: 'explanation')
  String explanation;
  @JsonKey(name: 'hdurl')
  String hdUrl;
  @JsonKey(name: 'media_type')
  String mediaType;
  @JsonKey(name: 'title')
  String title;

  Picture({
    required this.date,
    required this.explanation,
    required this.hdUrl,
    required this.mediaType,
    required this.title,
  });

  factory Picture.fromJson(Map<String, dynamic> json) =>
      _$PictureFromJson(json);

  @override
  String toString() {
    return 'Picture{date: $date, explanation: $explanation, hdUrl: $hdUrl, mediaType: $mediaType, title: $title}';
  }
}