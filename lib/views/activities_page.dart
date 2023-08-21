import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_track/controller/workout_provider.dart';

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
    workoutProvider.getActivityList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Activities"),
      ),
      body: FutureBuilder(
          future: workoutProvider.getActivityList(),
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
                        return ListTile(
                          title: Text(provider.updateActivityList[index].date),
                        );
                      },
                    );
            });
          }),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddActivityPage(
                      id: id,
                      name: name,
                      age: age,
                      bmi: bmi,
                      gender: gender,
                      height: height,
                      weight: weight),
                ));
          },
          label: const Row(
            children: [
              Text(
                'Add Activity',
                style: TextStyle(color: Colors.white, fontFamily: 'SofiaPro'),
              ),
              Icon(
                Icons.add,
                color: Colors.white,
              )
            ],
          )),
    );
  }
}
