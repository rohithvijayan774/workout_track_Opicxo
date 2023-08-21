import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:workout_track/model/model.dart';
import 'package:workout_track/model/update_model.dart';
import 'package:workout_track/views/add_person.dart';
import 'package:workout_track/views/home_screen.dart';
import 'package:path/path.dart';

class WorkoutProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  List<PersonModel> persons = [];
  List<UpdateModel> updateActivityList = [];
  List<UpdateModel> activitiesList = [];

  double? bmi;

  // addtoActivityList() {
  //   PersonModel person;
  //   person.activities = activitiesList;
  //   notifyListeners();
  // }

  getPersonsList() async {
    persons = await DatabaseHelper.instance.queryAllPersons();
    log('All datas Collected');
    notifyListeners();
    return persons;
  }

  getActivityList() async {
    updateActivityList = await DatabaseHelper.instance.getUpdatesForPerson();
    log('updates COllected');
    notifyListeners();
    return updateActivityList;
  }

  calculateBMI(double height, double weight) {
    height = height / 100;
    bmi = weight / (height * height);
    notifyListeners();
    return bmi;
  }

  clearFields() {
    nameController.clear();
    ageController.clear();
    heightController.clear();
    weightController.clear();
    selectedGender = 'male';
  }

//------------------------ For Bottom Nav Bar----------------------------------

  int currentIndex = 0;

  List<Widget> pages = [
    const HomeScreen(),
    const AddPerson(),
  ];

  updateIndex(int newIndex) {
    currentIndex = newIndex;

    notifyListeners();
  }

//----------------------For Gender Selection Widget-----------------------------
  String selectedGender = 'male';

  changeGender(String value) {
    selectedGender = value;

    notifyListeners();
  }

//---------------------For Adding Activities------------------------------------

  TextEditingController dateController = TextEditingController();
  TextEditingController meditationTimeController = TextEditingController();
  TextEditingController readingPageController = TextEditingController();
  DateTime? pickedDate;

  String gymSelection = 'yes';

  changeGymSelection(String value) {
    gymSelection = value;
    notifyListeners();
  }

  String meditationSelection = 'yes';

  changeMeditationSelection(String value) {
    meditationSelection = value;
    notifyListeners();
  }

  String readingSelection = 'yes';

  changeReadingSelection(String value) {
    readingSelection = value;
    notifyListeners();
  }

  datePicker(BuildContext context) async {
    pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2030));

    dateController.text = DateFormat('dd-MMM-yyyy').format(pickedDate!);

    notifyListeners();
  }
}

//----------------------Database Operation-----------------------------

class DatabaseHelper extends ChangeNotifier {
  static final DatabaseHelper instance = DatabaseHelper.privateConstructor();
  static Database? _database;

  DatabaseHelper.privateConstructor();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'person_database.db');
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute(
        'CREATE TABLE persons(id INTEGER PRIMARY KEY,name TEXT,age INTEGER,gender TEXT,height REAL,weight REAL,bmi TEXT)');
    await db.execute(
        'CREATE TABLE updates(id INTEGER PRIMARY KEY,person_id INTEGER,date TEXT, gym TEXT,meditation TEXT,meditationTime TEXT,reading TEXT,readingPages TEXT, FOREIGN KEY (person_id) REFERENCES persons (id))');
  }

  Future<int> insertPerson(PersonModel person) async {
    Database db = await instance.database;
    print('Successfully Stored');
    return await db.insert('persons', person.toMap());
  }

  Future<int> insertUpdates(int personId, UpdateModel update) async {
    Database db = await instance.database;
    print('SuccessFully Updated');
    return await db.insert('updates', update.toMap());
  }

  Future<List<PersonModel>> queryAllPersons() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> queryResults = await db.query('persons');
    return queryResults
        .map((personMap) => PersonModel.fromMap(personMap))
        .toList();
  }

  Future<List<UpdateModel>> getUpdatesForPerson() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('updates');
    return maps.map((updateMap) => UpdateModel.fromMap(updateMap)).toList();
  }

  Future<int> deletePerson(int id) async {
    Database db = await instance.database;
    return await db.delete('persons', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateActivites(int id, List<String> activities) async {
    final db = await instance.database;
    await db.update('persons', {'activities': activities},
        where: 'id = ?', whereArgs: [id]);
    notifyListeners();
    log('Successfully Updated');
  }

  // Future<int> updatePerson(PersonModel updatedPerson) async {
  //   Database db = await instance.database;

  //   String activityJson = jsonEncode(updatedPerson.activities);

  //   Map<String, dynamic> personData = updatedPerson.toMap();
  //   personData['activities'] = activityJson;
  //   return await db.update('persons', personData);
  // }

  factory DatabaseHelper() {
    return instance;
  }
}
