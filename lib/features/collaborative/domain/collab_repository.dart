abstract class CollabRepository {
  Stream<List<String>> watchCollaborators(String tripId);
  Future<void> addCollaborator(String tripId, String email);
  Future<void> removeCollaborator(String tripId, String email);
}