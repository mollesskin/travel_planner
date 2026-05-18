import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/collab_repository.dart';

final collabRepositoryProvider = Provider<CollabRepository>((ref) {
  return FirestoreCollabRepository(FirebaseFirestore.instance);
});

class FirestoreCollabRepository implements CollabRepository {
  final FirebaseFirestore _db;
  FirestoreCollabRepository(this._db);

  // Ch.16: .snapshots() provides a real-time Stream of updates
  @override
  Stream<List<String>> watchCollaborators(String tripId) {
    return _db
        .collection('shared_trips') // Ch.16: collection path
        .doc(tripId)
        .snapshots()
        .map((snap) {
          if (!snap.exists) return <String>[];
          final data = snap.data()!;
          return List<String>.from(
            data['collaborators'] as List<dynamic>? ?? []);
        });
  }

  // Ch.16: set() with merge:true — create or update
  @override
  Future<void> addCollaborator(String tripId, String email) {
    return _db.collection('shared_trips').doc(tripId).set({
      'tripId': tripId,
      // Ch.16: FieldValue.arrayUnion prevents duplicates
            'collaborators': FieldValue.arrayUnion([email]),
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  @override
  Future<void> removeCollaborator(String tripId, String email) {
    return _db.collection('shared_trips').doc(tripId).update({
      'collaborators': FieldValue.arrayRemove([email]),
    });
  }
}