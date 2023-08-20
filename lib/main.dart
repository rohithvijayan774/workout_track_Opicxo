import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_track/controller/workout_provider.dart';
import 'package:workout_track/utils/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WorkoutProvider>(
          create: (context) => WorkoutProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const BottomNavBar(),
      ),
    );
  }
}
