import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_track/controller/workout_provider.dart';
import 'package:workout_track/widgets/activity_details_tile.dart';

import 'add_activity_page.dart';

class ActivitiesPage extends StatelessWidget {
  final int id;
  final String name;
  final int age;
  final String bmi;
  final String gender;
  final double height;
  final double weight;
  const ActivitiesPage({
    required this.id,
    required this.name,
    required this.age,
    required this.bmi,
    required this.height,
    required this.weight,
    required this.gender,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final workoutProvider =
        Provider.of<WorkoutProvider>(context, listen: false);
    workoutProvider.getActivityList(id);
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddActivityPage(
                    id: id,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.add),
            label: const Text(
              'Add Activity',
              style: TextStyle(fontFamily: 'SofiaPro'),
            ),
          )
        ],
        title: const Text(
          "Activities",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 30,
          ),
        ),
      ),
      body: FutureBuilder(
          future: workoutProvider.getActivityList(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Consumer<WorkoutProvider>(builder: (context, provider, _) {
              return provider.updateActivityList.isEmpty
                  ? const Center(
                      child: Text('No Records'),
                    )
                  : ListView.builder(
                      itemCount: provider.updateActivityList.length,
                      itemBuilder: (context, index) {
                        return ActivityDetailsTile(
                            index: index,
                            meditationTime: provider
                                .updateActivityList[index].meditationTime,
                            readingPages:
                                provider.updateActivityList[index].readingPages,
                            gym: provider.updateActivityList[index].gym,
                            meditaion:
                                provider.updateActivityList[index].meditation,
                            reading: provider.updateActivityList[index].reading,
                            wakeupTime:
                                provider.updateActivityList[index].wakeupTime,
                            date: provider.updateActivityList[index].date);
                      },
                    );
            });
          }),
    );
  }
}
