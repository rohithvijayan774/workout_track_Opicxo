import 'package:flutter/material.dart';
import 'package:workout_track/views/activities_page.dart';
import 'package:workout_track/widgets/person_details_tile.dart';

class PersonDetailPage extends StatelessWidget {
  final int id;
  final String name;
  final int age;
  final String gender;
  final double height;
  final double weight;
  final String bmi;
  const PersonDetailPage({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.height,
    required this.weight,
    required this.bmi,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            decoration: const BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(400, 250),
                bottomRight: Radius.circular(100),
              ),
            ),
            child: Stack(
              children: [
                Align(
                    alignment: const AlignmentDirectional(-1, -0.6),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_rounded))),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Text(
                    name,
                    style: const TextStyle(fontFamily: 'Poppins', fontSize: 30),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 1.5),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'BMI',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'SofiaPro',
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            bmi,
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'SofiaPro',
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  PersonDetailsTile(
                      title: 'Age',
                      imagePath: 'lib/assets/icons/age.png',
                      trailing: '$age yrs'),
                  PersonDetailsTile(
                      title: 'Gender',
                      imagePath: gender == 'male'
                          ? 'lib/assets/icons/male.png'
                          : gender == 'female'
                              ? 'lib/assets/icons/female.png'
                              : 'lib/assets/icons/other.png',
                      trailing: gender),
                  PersonDetailsTile(
                      title: 'Height',
                      imagePath: 'lib/assets/icons/height.png',
                      trailing: '$height cm'),
                  PersonDetailsTile(
                      title: 'Weight',
                      imagePath: 'lib/assets/icons/weight.png',
                      trailing: '$weight kg'),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ActivitiesPage(
                        id: id,
                        name: name,
                        age: age,
                        bmi: bmi,
                        height: height,
                        weight: weight,
                        gender: gender,
                      ),
                    ));
              },
              child: const Row(
                children: [
                  Text(
                    'Show Activities',
                    style: TextStyle(
                        fontFamily: 'SofiaPro',
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  Icon(Icons.arrow_forward_rounded)
                ],
              ),
            ),
          ],
        ),
      ),
     
    );
  }
}
