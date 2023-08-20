import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_track/controller/workout_provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutProvider>(builder: (context, provider, _) {
      return Scaffold(
        body: provider.pages[provider.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: provider.currentIndex,
          onTap: (index) {
            provider.updateIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Persons',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_add_alt_1_sharp),
              label: 'Add Person',
            ),
          ],
        ),
      );
    });
  }
}
