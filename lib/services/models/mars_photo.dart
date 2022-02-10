import 'package:json_annotation/json_annotation.dart';

part 'mars_photo.g.dart';

@JsonSerializable()
class MarsPhoto {
  @JsonKey(name: 'img_src')
  final String imageSource;

  MarsPhoto({required this.imageSource});

  factory MarsPhoto.fromJson(Map<String, dynamic> json) =>
      _$MarsPhotoFromJson(json);
}