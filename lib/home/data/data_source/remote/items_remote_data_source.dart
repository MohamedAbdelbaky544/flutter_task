import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_task/home/data/models/trip_model/trip_model.dart';
import 'package:injectable/injectable.dart';

abstract class ItemsRemoteDataSource {
  void addTrip({
    required TripModel trip,
  });

  Future<QuerySnapshot<Map>> getTrips();
}

@LazySingleton(as: ItemsRemoteDataSource)
class ItemsRemoteDataSourceImpl implements ItemsRemoteDataSource {
  final storage = FirebaseFirestore.instance;

  @override
  void addTrip({
    required TripModel trip,
  }) {
    storage.collection('trips').doc().set(trip.toJson());
  }

  @override
  Future<QuerySnapshot<Map>> getTrips() {
    return storage.collection('trips').get();
  }
}
