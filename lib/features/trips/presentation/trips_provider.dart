import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../data/trip_repository_impl.dart';
import '../domain/trip_model.dart';

// Ch.13 + Ch.14: StreamProvider for reactive Drift watch()
final tripsStreamProvider = StreamProvider<List<TripModel>>((ref) {
  return ref.watch(tripsRepositoryProvider).watchTrips();
});

// Ch.13: StateNotifierProvider for mutations (add, delete)
final tripsNotifierProvider =
    StateNotifierProvider<TripsNotifier, AsyncValue<void>>((ref) {
  return TripsNotifier(ref.watch(tripsRepositoryProvider));
});

class TripsNotifier extends StateNotifier<AsyncValue<void>> {
  final TripsRepository _repo;
  TripsNotifier(this._repo) : super(const AsyncValue.data(null));

  Future<void> addTrip(String title, String destination) async {
    state = const AsyncValue.loading();
    try {
      await _repo.addTrip(TripModel(
        id:          const Uuid().v4(),
        title:       title,
        destination: destination,
        startDate:   DateTime.now(),
        endDate:     DateTime.now().add(const Duration(days: 7)),
        ));
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> deleteTrip(String id) async {
    try {
      await _repo.deleteTrip(id);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
