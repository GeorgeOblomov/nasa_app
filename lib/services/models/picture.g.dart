// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Picture _$PictureFromJson(Map<String, dynamic> json) => Picture(
      date: DateTime.parse(json['date'] as String),
      explanation: json['explanation'] as String,
      hdUrl: json['hdurl'] as String?,
      mediaType: json['media_type'] as String,
      title: json['title'] as String,
    );