// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Movie _$$_MovieFromJson(Map<String, dynamic> json) => _$_Movie(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      year: json['year'] as String? ?? '',
      director: json['director'] as String? ?? '',
      posterUrl: json['posterUrl'] as String? ?? '',
    );

Map<String, dynamic> _$$_MovieToJson(_$_Movie instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'year': instance.year,
      'director': instance.director,
      'posterUrl': instance.posterUrl,
    };
