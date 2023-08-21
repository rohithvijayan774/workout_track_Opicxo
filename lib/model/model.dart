import 'dart:convert';

import 'package:workout_track/model/update_model.dart';

class PersonModel {
  int? id;
  String name;
  int age;
  String gender;
  double height;
  double weight;
  String bmi;

  PersonModel({
    this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.height,
    required this.weight,
    required this.bmi,
  });

  factory PersonModel.fromMap(Map<String, dynamic> map) {
    return PersonModel(
      id: map['id'],
      name: map['name'],
      age: map['age'],
      gender: map['gender'],
      height: map['height'],
      weight: map['weight'],
      bmi: map['bmi'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'gender': gender,
      'height': height,
      'weight': weight,
      'bmi': bmi,
    };
  }
}
