import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/firestore_repo_impl.dart';

class CollabScreen extends ConsumerWidget {
  final String tripId;
  const CollabScreen({required this.tripId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collaboratorsStream =
        ref.watch(collabRepositoryProvider).watchCollaborators(tripId);

    return Scaffold(
      appBar: AppBar(title: const Text('Collaborators')),
      body: StreamBuilder<List<String>>(
        stream: collaboratorsStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final collaborators = snapshot.data ?? [];
          if (collaborators.isEmpty) {
            return const Center(child: Text('No collaborators yet'));
          }
          return ListView.builder(
            itemCount: collaborators.length,
            itemBuilder: (context, index) =>
                ListTile(title: Text(collaborators[index])),
          );
        },
      ),
    );
  }
}