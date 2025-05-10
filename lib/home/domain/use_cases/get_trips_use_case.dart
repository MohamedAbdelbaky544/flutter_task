import 'package:dartz/dartz.dart';
import 'package:flutter_task/core/domain/entities/failure.dart';
import 'package:flutter_task/core/domain/use_case/use_case.dart';
import 'package:flutter_task/home/domain/entities/trip.dart';
import 'package:flutter_task/home/domain/repositories/trip_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetTripsUseCase extends UseCase<List<Trip>, NoParams> {
  final TripRepository repository;

  GetTripsUseCase({required this.repository});
  @override
  Future<Either<Failure, List<Trip>>> call(NoParams params) async {
    return await repository.getTrips();
  }
}
