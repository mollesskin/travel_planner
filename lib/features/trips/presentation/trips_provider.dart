import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../data/trip_repository_impl.dart';
import '../domain/trip_model.dart';

final tripsStreamProvider = StreamProvider<List<TripModel>>((ref) {
  return ref.watch(tripsRepositoryProvider).watchTrips();
});

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
      await _repo.addTrip(
        TripModel(
          id: const Uuid().v4(),
          title: title,
          destination: destination,
          startDate: DateTime.now(),
          endDate: DateTime.now().add(const Duration(days: 3)),
          createdAt: DateTime.now(),
        ),
      );

      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> deleteTrip(String id) async {
    state = const AsyncValue.loading();

    try {
      await _repo.deleteTrip(id);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}