import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_track/controller/workout_provider.dart';
import 'package:workout_track/views/person_detail_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final workoutProvider =
        Provider.of<WorkoutProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Persons',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 30,
          ),
        ),
      ),
      body: FutureBuilder(
          future: workoutProvider.getPersonsList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return Consumer<WorkoutProvider>(
              builder: (context, provider, _) {
                return provider.persons.isEmpty
                    ? const Center(
                        child: Text('No data found'),
                      )
                    : ListView.builder(
                        itemCount: provider.persons.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onLongPress: () async {
                              await DatabaseHelper.instance
                                  .deletePerson(provider.persons[index].id!)
                                  .then(
                                (value) {
                                  provider.getPersonsList();
                                },
                              );
                            },
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PersonDetailPage(
                                      id: provider.persons[index].id!,
                                      name: provider.persons[index].name,
                                      age: provider.persons[index].age,
                                      gender: provider.persons[index].gender,
                                      height: provider.persons[index].height,
                                      weight: provider.persons[index].weight,
                                      bmi: provider.persons[index].bmi,
                                    ),
                                  ));
                            },
                            title: Text(
                              provider.persons[index].name,
                              style: const TextStyle(
                                  fontFamily: 'SofiaPro',
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700),
                            ),
                            subtitle: Text(
                              'Age : ${provider.persons[index].age}',
                              style: const TextStyle(
                                fontFamily: 'SofiaPro',
                              ),
                            ),
                            trailing: Text(
                              'BMI ${provider.persons[index].bmi}',
                              style: const TextStyle(
                                  fontFamily: 'SofiaPro', fontSize: 15),
                            ),
                          );
                        },
                      );
              },
            );
          }),
    );
  }
}
