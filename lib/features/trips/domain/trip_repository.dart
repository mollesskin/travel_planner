import 'trip_model.dart';

abstract class TripsRepository {
  Stream<List<TripModel>> watchTrips();
  Future<void> addTrip(TripModel trip);
  Future<void> deleteTrip(String id);
}