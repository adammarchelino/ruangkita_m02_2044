import 'package:flutter/material.dart';
import 'package:ruangkita_m02/models/room_session.dart';

class RuangPraktikumPage extends StatefulWidget {
  const RuangPraktikumPage({super.key});

  @override
  State<RuangPraktikumPage> createState() => _RuangPraktikumPageState();
}

class _RuangPraktikumPageState extends State<RuangPraktikumPage> {
  bool isDarkMode = false;
  String selectedStatus = 'Semua';

  @override
  Widget build(BuildContext context) {
    final filteredSessions = selectedStatus == 'Semua'
        ? roomSessions
        : roomSessions
              .where((session) => session.status == selectedStatus)
              .toList();

    return Theme(
      data: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: isDarkMode ? Brightness.dark : Brightness.light,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('RuangKita'),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  isDarkMode = !isDarkMode;
                });
              },
              icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
              tooltip: 'Ganti tema',
            ),
          ],
        ),

        body: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;

            // Compact: lebar kurang dari 600 dp
            if (width < 600) {
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Text(
                    'M02-2044',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  StatusFilter(
                    selectedStatus: selectedStatus,
                    onStatusChanged: (status) {
                      setState(() {
                        selectedStatus = status;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  ...roomSessions.map(
                    (session) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: RoomSessionCard(session: session),
                    ),
                  ),
                ],
              );
            }

            // Medium = 2 kolom, Expanded = 3 kolom
            final columnCount = width < 840 ? 2 : 3;

            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'M02-2044',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 16),
                        StatusFilter(
                          selectedStatus: selectedStatus,
                          onStatusChanged: (status) {
                            setState(() {
                              selectedStatus = status;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return RoomSessionCard(session: filteredSessions[index]);
                    }, childCount: filteredSessions.length),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columnCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      mainAxisExtent: 250,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class RoomSessionCard extends StatelessWidget {
  final RoomSession session;

  const RoomSessionCard({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 52, 16, 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.video_camera_back_outlined,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        session.roomName,
                        style: Theme.of(context).textTheme.labelLarge,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        session.activityName,
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        session.time,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        session.description,
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: _StatusBadge(status: session.status),
          ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        status,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: colorScheme.onSecondaryContainer,
        ),
      ),
    );
  }
}

class StatusFilter extends StatelessWidget {
  final String selectedStatus;
  final ValueChanged<String> onStatusChanged;

  const StatusFilter({
    super.key,
    required this.selectedStatus,
    required this.onStatusChanged,
  });

  static const statuses = [
    'Semua',
    'Berlangsung',
    'Akan Datang',
    'Selesai',
    'Tersedia',
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: statuses.map((status) {
        return ChoiceChip(
          label: Text(status),
          selected: selectedStatus == status,
          onSelected: (_) {
            onStatusChanged(status);
          },
        );
      }).toList(),
    );
  }
}
