// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_const_declarations

part of 'trip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripModel _$TripModelFromJson(Map json) {
  print(json['startDate']);
  return TripModel(
    id: json['id'] as String,
    itemTitle: json['itemTitle'] as String,
    startDate: (json['startDate'] as Timestamp).toDate(),
    endDate: (json['startDate'] as Timestamp).toDate(),
    unfinishedTasks: (json['unfinishedTasks'] as num).toInt(),
    nights: (json['nights'] as num).toInt(),
    image: json['image'] as String?,
    tourists: (json['tourists'] as List<dynamic>?)
        ?.map((e) => TouristModel.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList(),
  );
}

Map<String, dynamic> _$TripModelToJson(TripModel instance) => <String, dynamic>{
      'id': instance.id,
      'itemTitle': instance.itemTitle,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'unfinishedTasks': instance.unfinishedTasks,
      'nights': instance.nights,
      if (instance.image case final value?) 'image': value,
      if (instance.tourists?.map((e) => e.toJson()).toList() case final value?)
        'tourists': value,
    };
