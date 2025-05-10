import 'package:dartz/dartz.dart';
import 'package:flutter_task/core/domain/entities/failure.dart';
import 'package:flutter_task/home/domain/entities/trip.dart';

abstract class TripRepository {
  Future<Either<Failure, List<Trip>>> getTrips();
}
