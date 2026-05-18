import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TripDetailScreen extends StatelessWidget {
  final String tripId;

  const TripDetailScreen({
    super.key,
    required this.tripId,
  });

  @override
  Widget build(BuildContext context) {
    final trip = _getTripById(tripId);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            pinned: true,
            title: Text(trip.title),
            expandedHeight: 220,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                padding: const EdgeInsets.fromLTRB(24, 96, 24, 24),
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.primaryContainer,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Text(
                  trip.destination,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: _TripSummaryCard(trip: trip),
            ),
          ),

          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Text(
                'Trip Actions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList.list(
              children: [
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.search),
                    title: const Text('Search places for this trip'),
                    subtitle: const Text('Find attractions, restaurants, and events'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      context.push('/home/trip/$tripId/search');
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.group),
                    title: const Text('Collaboration'),
                    subtitle: const Text('Invite friends and plan together'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      context.push('/home/trip/$tripId/collab');
                    },
                  ),
                ),
              ],
            ),
          ),

          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
              child: Text(
                'Planned Schedule',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SliverList.separated(
            itemCount: trip.schedule.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final item = trip.schedule[index];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                    title: Text(item.title),
                    subtitle: Text(item.time),
                  ),
                ),
              );
            },
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 32),
          ),
        ],
      ),
    );
  }

  _TripDetailData _getTripById(String id) {
    final trips = [
      _TripDetailData(
        id: '1',
        title: 'Astana Weekend',
        destination: 'Astana, Kazakhstan',
        date: 'May 20 - May 22',
        members: '4 members',
        budget: '120 000 KZT',
        schedule: [
          _ScheduleItem(title: 'Visit Baiterek Tower', time: 'Day 1 • 11:00'),
          _ScheduleItem(title: 'Astana Opera evening event', time: 'Day 1 • 19:00'),
          _ScheduleItem(title: 'National Museum', time: 'Day 2 • 13:00'),
        ],
      ),
      _TripDetailData(
        id: '2',
        title: 'Almaty Food Tour',
        destination: 'Almaty, Kazakhstan',
        date: 'June 5 - June 8',
        members: '3 members',
        budget: '180 000 KZT',
        schedule: [
          _ScheduleItem(title: 'Green Bazaar', time: 'Day 1 • 10:00'),
          _ScheduleItem(title: 'Kok Tobe', time: 'Day 2 • 16:00'),
          _ScheduleItem(title: 'Local cafe tour', time: 'Day 3 • 12:00'),
        ],
      ),
      _TripDetailData(
        id: '3',
        title: 'Shymbulak Trip',
        destination: 'Almaty Mountains',
        date: 'July 10 - July 12',
        members: '5 members',
        budget: '220 000 KZT',
        schedule: [
          _ScheduleItem(title: 'Cable car ride', time: 'Day 1 • 09:30'),
          _ScheduleItem(title: 'Mountain walk', time: 'Day 1 • 14:00'),
          _ScheduleItem(title: 'Photo point stop', time: 'Day 2 • 11:00'),
        ],
      ),
    ];

    return trips.firstWhere(
      (trip) => trip.id == id,
      orElse: () => trips.first,
    );
  }
}

class _TripSummaryCard extends StatelessWidget {
  final _TripDetailData trip;

  const _TripSummaryCard({
    required this.trip,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _SummaryRow(
              icon: Icons.calendar_month,
              label: 'Date',
              value: trip.date,
            ),
            const Divider(),
            _SummaryRow(
              icon: Icons.people,
              label: 'Members',
              value: trip.members,
            ),
            const Divider(),
            _SummaryRow(
              icon: Icons.account_balance_wallet,
              label: 'Budget',
              value: trip.budget,
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _SummaryRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(label),
      trailing: Text(
        value,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _TripDetailData {
  final String id;
  final String title;
  final String destination;
  final String date;
  final String members;
  final String budget;
  final List<_ScheduleItem> schedule;

  const _TripDetailData({
    required this.id,
    required this.title,
    required this.destination,
    required this.date,
    required this.members,
    required this.budget,
    required this.schedule,
  });
}

class _ScheduleItem {
  final String title;
  final String time;

  const _ScheduleItem({
    required this.title,
    required this.time,
  });
}