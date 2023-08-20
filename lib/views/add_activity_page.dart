import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_track/controller/workout_provider.dart';
import 'package:intl/intl.dart';
import 'package:workout_track/widgets/gym_selection.dart';
import 'package:workout_track/widgets/meditation_selection.dart';
import 'package:workout_track/widgets/reading_selection.dart';

class AddActivityPage extends StatelessWidget {
  const AddActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Activity',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 30,
          ),
        ),
      ),
      body: Consumer<WorkoutProvider>(builder: (context, provider, _) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Date',
                  style: TextStyle(
                      fontFamily: 'SofiaPro',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: TextFormField(
                    onTap: () {
                      provider.datePicker(context);
                      if (provider.pickedDate != null) {}
                    },
                    controller: provider.dateController,
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      hintText: 'Pick Date',
                      hintStyle: TextStyle(fontFamily: 'SofiaPro'),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                      ),
                    ),
                  ),
                ),
                const Text(
                  'Gym',
                  style: TextStyle(
                      fontFamily: 'SofiaPro',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const GymSelection(),
                const Text(
                  'Meditation',
                  style: TextStyle(
                      fontFamily: 'SofiaPro',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const MeditationSelection(),
                provider.meditationSelection == 'yes'
                    ? Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 20),
                        child: TextFormField(
                          controller: provider.meditationTimeController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: 'How much minutes',
                            hintStyle: TextStyle(fontFamily: 'SofiaPro'),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
                const Text(
                  'Reading',
                  style: TextStyle(
                      fontFamily: 'SofiaPro',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const ReadingSelection(),
                provider.readingSelection == 'yes'
                    ? Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 20),
                        child: TextFormField(
                          controller: provider.readingPageController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: 'No. of pages',
                            hintStyle: TextStyle(fontFamily: 'SofiaPro'),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Add Activity',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'SofiaPro',
                                fontSize: 15),
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
