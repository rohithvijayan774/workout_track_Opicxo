import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_track/controller/workout_provider.dart';

class GenderSelectionWidget extends StatelessWidget {
  const GenderSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutProvider>(
      builder: (context, provider, _) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListTile(
              title: const Text(
                'Male',
                style: TextStyle(
                    fontFamily: 'SofiaPro', fontWeight: FontWeight.w500),
              ),
              leading: Radio(
                value: 'male',
                groupValue: provider.selectedGender,
                onChanged: (value) {
                  provider.selectedGender = value!;
                  provider.changeGender(value);
                },
              ),
            ),
            ListTile(
              title: const Text(
                'Female',
                style: TextStyle(
                    fontFamily: 'SofiaPro', fontWeight: FontWeight.w500),
              ),
              leading: Radio(
                value: 'female',
                groupValue: provider.selectedGender,
                onChanged: (value) {
                  provider.selectedGender = value!;
                  provider.changeGender(value);
                },
              ),
            ),
            ListTile(
              title: const Text(
                'Other',
                style: TextStyle(
                    fontFamily: 'SofiaPro', fontWeight: FontWeight.w500),
              ),
              leading: Radio(
                value: 'other',
                groupValue: provider.selectedGender,
                onChanged: (value) {
                  provider.selectedGender = value!;
                  provider.changeGender(value);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
