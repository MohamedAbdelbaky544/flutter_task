// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_const_declarations

part of 'tourist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TouristModel _$TouristModelFromJson(Map json) => TouristModel(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$TouristModelToJson(TouristModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      if (instance.image case final value?) 'image': value,
    };
