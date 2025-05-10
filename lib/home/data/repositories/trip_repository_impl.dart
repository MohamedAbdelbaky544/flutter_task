import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_task/core/domain/entities/enum/server_error_code.dart';
import 'package:flutter_task/core/domain/entities/failure.dart';
import 'package:flutter_task/home/data/data_source/remote/items_remote_data_source.dart';
import 'package:flutter_task/home/data/models/trip_model/trip_model.dart';
import 'package:flutter_task/home/domain/entities/trip.dart';
import 'package:flutter_task/home/domain/repositories/trip_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TripRepository)
class TripRepositoryImpl implements TripRepository {
  final ItemsRemoteDataSource remote;

  TripRepositoryImpl({required this.remote});

  @override
  Future<Either<Failure, List<Trip>>> getTrips() async {
    try {
      var result = await remote.getTrips();
      var temp = result.docs;
      log(result.docs.length.toString());
      var tripsModel = temp
          .map((e) => TripModel.fromJson(e.data() as Map<String, dynamic>))
          .toList();

      log(tripsModel.toString());

      return Right(tripsModel.map((e) => e.toDomain()).toList());
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure(errorCode: ServerErrorCode.serverError));
    }
  }
}
