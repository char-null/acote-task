// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDetailModelImpl _$$UserDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserDetailModelImpl(
      name: json['name'] as String,
      description: json['description'] as String?,
      language: json['language'] as String?,
      stargazersCount: (json['stargazers_count'] as num).toInt(),
    );

Map<String, dynamic> _$$UserDetailModelImplToJson(
        _$UserDetailModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'language': instance.language,
      'stargazers_count': instance.stargazersCount,
    };
