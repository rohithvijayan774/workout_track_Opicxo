import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_track/controller/workout_provider.dart';
import 'package:workout_track/widgets/activities_tile.dart';

class ActivityDetailsTile extends StatelessWidget {
  final String date;
  final String wakeupTime;
  final String gym;
  final String meditaion;
  final String reading;
  final String meditationTime;
  final String readingPages;
  final int index;

  const ActivityDetailsTile({
    required this.date,
    required this.wakeupTime,
    required this.gym,
    required this.meditaion,
    required this.reading,
    required this.readingPages,
    required this.meditationTime,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Consumer<WorkoutProvider>(builder: (context, provider, _) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
          width: MediaQuery.of(context).size.width,
          // height: 300,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  date,
                  style: const TextStyle(
                      fontFamily: 'SofiaPro',
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                ActivitiesTile(
                    title: 'Wakeup Time',
                    imagePath: 'lib/assets/icons/wakeup.png',
                    trailing: wakeupTime),
                ActivitiesTile(
                    title: 'Gym',
                    imagePath: 'lib/assets/icons/gym.png',
                    trailing: gym),
                ActivitiesTile(
                    title: 'Meditation',
                    imagePath: 'lib/assets/icons/meditation.png',
                    trailing: meditaion == 'yes'
                        ? '$meditationTime mins'
                        : meditaion),
                ActivitiesTile(
                    title: 'Reading',
                    imagePath: 'lib/assets/icons/reading.png',
                    trailing: reading == 'yes' ? '$readingPages pgs' : reading),
              ],
            ),
          ),
        );
      }),
    );
  }
}
