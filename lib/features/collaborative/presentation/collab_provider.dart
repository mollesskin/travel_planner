import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/firestore_repo_impl.dart';

final collaboratorsProvider = StreamProvider.family<List<String>, String>((ref, tripId) {
  return ref.watch(collabRepositoryProvider).watchCollaborators(tripId);
});