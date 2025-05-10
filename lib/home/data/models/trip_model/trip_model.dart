// import 'package:flutter_task/core/data/utils/custom_date_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_task/home/data/models/tourist_model/tourist_model.dart';
import 'package:flutter_task/home/domain/entities/trip.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trip_model.g.dart';

@JsonSerializable(createToJson: true)
class TripModel {
  final String id;
  final String itemTitle;
  // @CustomDateTimeConverter()
  final DateTime startDate;
  // @CustomDateTimeConverter()
  final DateTime endDate;
  final int unfinishedTasks;
  final int nights;
  final String? image;

  final List<TouristModel>? tourists;

  TripModel({
    required this.id,
    required this.itemTitle,
    required this.startDate,
    required this.endDate,
    required this.unfinishedTasks,
    required this.nights,
    this.image,
    this.tourists,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) =>
      _$TripModelFromJson(json);

  Map<String, dynamic> toJson() => _$TripModelToJson(this);
}

extension MapFromDomain on Trip {
  TripModel fromDomain() => TripModel(
        id: id,
        itemTitle: itemTitle,
        startDate: startDate,
        endDate: endDate,
        unfinishedTasks: unfinishedTasks,
        nights: nights,
        image: image,
        tourists: tourists?.map((e) => e.fromDomain()).toList(),
      );
}

extension MapToDomain on TripModel {
  Trip toDomain() => Trip(
        id: id,
        itemTitle: itemTitle,
        startDate: startDate,
        endDate: endDate,
        unfinishedTasks: unfinishedTasks,
        nights: nights,
        image: image,
        tourists: tourists?.map((e) => e.toDomain()).toList(),
      );
}
