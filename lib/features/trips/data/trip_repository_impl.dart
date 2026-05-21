import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/trip_model.dart';
import '../domain/trip_repository.dart';
import '../local/app_database.dart';

final tripsRepositoryProvider = Provider<TripsRepository>((ref) {
  return TripRepositoryImpl(ref.watch(appDatabaseProvider));
});

class TripRepositoryImpl implements TripsRepository {
  final AppDatabase _db;
  TripRepositoryImpl(this._db);

  @override
  Stream<List<TripModel>> watchTrips() {
    return _db.watchAllTrips().map((rows) => rows.map((row) {
          return TripModel(
            id: row.id,
            title: row.title,
            destination: row.destination,
            startDate: row.startDate,
            endDate: row.endDate,
            collaborators: row.collaborators.isEmpty
                ? []
                : row.collaborators.split(','),
            notes: row.notes,
          );
        }).toList());
  }

  @override
  Future<void> addTrip(TripModel trip) async {
    await _db.insertTrip(TripsCompanion.insert(
      id: trip.id,
      title: trip.title,
      destination: trip.destination,
      startDate: trip.startDate,
      endDate: trip.endDate,
      collaborators: Value(trip.collaborators.join(',')),
      notes: Value(trip.notes),
    ));
  }

  @override
  Future<void> deleteTrip(String id) => _db.deleteTrip(id);
}
