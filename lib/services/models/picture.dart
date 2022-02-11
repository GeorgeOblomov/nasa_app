import 'package:json_annotation/json_annotation.dart';
part 'picture.g.dart';

@JsonSerializable()
class Picture {
  @JsonKey(name: 'hdurl', defaultValue: null)
  String? hdUrl;
  @JsonKey(name: 'title')
  String title;

  Picture({
    required this.hdUrl,
    required this.title,
  });

  factory Picture.fromJson(Map<String, dynamic> json) =>
      _$PictureFromJson(json);

  @override
  String toString() {
    return 'Picture{hdUrl: $hdUrl, title: $title}';
  }
}