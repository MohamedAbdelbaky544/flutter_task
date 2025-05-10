import 'package:flutter_task/home/domain/entities/tourist.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tourist_model.g.dart';

@JsonSerializable(createToJson: true)
class TouristModel {
  final String id;
  final String name;
  final String? image;

  TouristModel({
    required this.id,
    required this.name,
    this.image,
  });

  factory TouristModel.fromJson(Map<String, dynamic> json) =>
      _$TouristModelFromJson(json);

  Map<String, dynamic> toJson() => _$TouristModelToJson(this);
}

extension MapFromDomain on Tourist {
  TouristModel fromDomain() => TouristModel(id: id, name: name, image: image);
}

extension MapToDomain on TouristModel {
  Tourist toDomain() => Tourist(id: id, name: name, image: image);
}
