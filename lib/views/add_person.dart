import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_track/controller/workout_provider.dart';
import 'package:workout_track/model/model.dart';
import 'package:workout_track/widgets/gender_selection.dart';

class AddPerson extends StatelessWidget {
  const AddPerson({super.key});

  @override
  Widget build(BuildContext context) {
    final workoutProvider =
        Provider.of<WorkoutProvider>(context, listen: false);
    log('Data : ${workoutProvider.persons.length}');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Persons',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Form(
            key: workoutProvider.personAddingFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Name',
                  style: TextStyle(
                      fontFamily: 'SofiaPro',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required Field';
                      }
                      return null;
                    },
                    controller: workoutProvider.nameController,
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      hintText: 'Enter Name',
                      hintStyle: TextStyle(fontFamily: 'SofiaPro'),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                      ),
                    ),
                  ),
                ),
                const Text(
                  'Age',
                  style: TextStyle(
                      fontFamily: 'SofiaPro',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required Field';
                      }
                      return null;
                    },
                    controller: workoutProvider.ageController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Enter Age',
                      hintStyle: TextStyle(fontFamily: 'SofiaPro'),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                      ),
                    ),
                  ),
                ),
                //Gender selection------------------------
                const Text(
                  'Gender',
                  style: TextStyle(
                      fontFamily: 'SofiaPro',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const GenderSelectionWidget(),
                const Text(
                  'Height (in Cms)',
                  style: TextStyle(
                      fontFamily: 'SofiaPro',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required Field';
                      }
                      return null;
                    },
                    controller: workoutProvider.heightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Enter Height',
                      hintStyle: TextStyle(fontFamily: 'SofiaPro'),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                      ),
                    ),
                  ),
                ),
                const Text(
                  'Weight (in Kgs)',
                  style: TextStyle(
                      fontFamily: 'SofiaPro',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required Field';
                      }
                      return null;
                    },
                    controller: workoutProvider.weightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Enter Weight',
                      hintStyle: TextStyle(fontFamily: 'SofiaPro'),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black)),
                        onPressed: () async {
                          if (workoutProvider.personAddingFormKey.currentState!
                              .validate()) {
                            double height = double.parse(
                                workoutProvider.heightController.text);
                            double weight = double.parse(
                                workoutProvider.weightController.text);
                            workoutProvider.calculateBMI(height, weight);

                            String formattedBMI =
                                workoutProvider.bmi!.toStringAsFixed(2);

                            PersonModel person = PersonModel(
                              name: workoutProvider.nameController.text,
                              age:
                                  int.parse(workoutProvider.ageController.text),
                              gender: workoutProvider.selectedGender,
                              height: height,
                              weight: weight,
                              bmi: formattedBMI,
                            );
                            await DatabaseHelper.instance
                                .insertPerson(person)
                                .then((value) {
                              workoutProvider.clearFields();
                              workoutProvider.updateIndex(0);
                            });
                          }
                        },
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'SofiaPro',
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
