import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/theme_provider.dart';
import '../../../features/auth/data/auth_repository_impl.dart';
import 'trips_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Ch.13: ref.watch reacts to stream changes
    final tripsAsync = ref.watch(tripsStreamProvider);
    final isDark     = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Trips'),
        actions: [
          // Ch.10: theme toggle persisted with SharedPreferences
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            tooltip: 'Toggle Theme',
            onPressed: () =>
              ref.read(themeProvider.notifier).toggleTheme(),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () async {
              await ref.read(authRepositoryProvider).logout();
              if (context.mounted) context.go('/login');
            },
          ),
        ],
              ),
      // Ch.13: AsyncValue.when() for loading/error/data
      body: tripsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error:   (e, _) => Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 8),
            Text('Error: $e', textAlign: TextAlign.center),
          ]),
        ),
        data: (trips) {
          if (trips.isEmpty) {
            return const Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Icon(Icons.luggage, size: 72, color: Colors.grey),
                SizedBox(height: 12),
                Text('No trips yet — tap + to create one!',
                  style: TextStyle(color: Colors.grey)),
              ]),
            );
          }
          // Ch.5: ListView.builder — lazy, efficient list
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: trips.length,
            itemBuilder: (ctx, i) {
              final trip = trips[i];
              return Dismissible(
                key: Key(trip.id),
                direction: DismissDirection.endToStart,
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20),
                  color: Colors.red,
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (_) =>
                  ref.read(tripsNotifierProvider.notifier)
                    .deleteTrip(trip.id),
                child: Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.flight_takeoff)),
                    title: Text(trip.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold)),
                    subtitle: Text(trip.destination),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () =>
                      context.go('/home/trip/${trip.id}'),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddDialog(context, ref),
        icon: const Icon(Icons.add),
        label: const Text('New Trip'),
              ),
    );
  }

  void _showAddDialog(BuildContext context, WidgetRef ref) {
    final titleCtrl = TextEditingController();
    final destCtrl  = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('New Trip'),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          TextField(controller: titleCtrl,
            decoration: const InputDecoration(
              labelText: 'Trip Title',
              border: OutlineInputBorder())),
          const SizedBox(height: 12),
          TextField(controller: destCtrl,
            decoration: const InputDecoration(
              labelText: 'Destination',
              border: OutlineInputBorder())),
        ]),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel')),
          FilledButton(
            onPressed: () {
              if (titleCtrl.text.isNotEmpty) {
                ref.read(tripsNotifierProvider.notifier)
                  .addTrip(titleCtrl.text, destCtrl.text);
                Navigator.pop(ctx);
              }
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }
}

