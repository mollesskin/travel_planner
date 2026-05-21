import 'package:drift/drift.dart';
import 'package:drift/web.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'app_database.g.dart';

class Trips extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get destination => text()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime()();
  TextColumn get collaborators => text().withDefault(const Constant(''))();
  TextColumn get notes => text().withDefault(const Constant(''))();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [Trips])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(WebDatabase('travel_planner'));

  @override
  int get schemaVersion => 1;

  Stream<List<Trip>> watchAllTrips() => select(trips).watch();

  Future<void> insertTrip(TripsCompanion entry) =>
      into(trips).insert(entry);

  Future<void> deleteTrip(String id) =>
      (delete(trips)..where((t) => t.id.equals(id))).go();
}

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});