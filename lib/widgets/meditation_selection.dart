import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_track/controller/workout_provider.dart';

class MeditationSelection extends StatelessWidget {
  const MeditationSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutProvider>(
      builder: (context, provider, _) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListTile(
              title: const Text(
                'Yes',
                style: TextStyle(
                    fontFamily: 'SofiaPro', fontWeight: FontWeight.w500),
              ),
              leading: Radio(
                value: 'yes',
                groupValue: provider.meditationSelection,
                onChanged: (value) {
                  provider.meditationSelection = value!;
                  provider.changeMeditationSelection(value);
                },
              ),
            ),
            ListTile(
              title: const Text(
                'No',
                style: TextStyle(
                    fontFamily: 'SofiaPro', fontWeight: FontWeight.w500),
              ),
              leading: Radio(
                value: 'no',
                groupValue: provider.meditationSelection,
                onChanged: (value) {
                  provider.meditationSelection = value!;
                  provider.changeMeditationSelection(value);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
