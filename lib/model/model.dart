class PersonModel {
  int? id;
  String name;
  int age;
  String gender;
  double height;
  double weight;
  String bmi;
  String? date;
  String? wakeupTime;
  String? gym;
  String? meditaion;
  String? meditaionTime;
  String? reading;
  String? readingPages;

  PersonModel({
    this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.height,
    required this.weight,
    required this.bmi,
    this.date,
    this.wakeupTime,
    this.gym,
    this.meditaion,
    this.meditaionTime,
    this.reading,
    this.readingPages,
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
      date: map['date'],
      wakeupTime: map['wakeupTime'],
      gym: map['gym'],
      meditaion: map['meditation'],
      meditaionTime: map['meditationTime'],
      reading: map['reading'],
      readingPages: map['readingPages'],
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
      'date': date,
      'wakeupTime': wakeupTime,
      'gym': gym,
      'meditation': meditaion,
      'meditationTime': meditaionTime,
      'reading': reading,
      'readingPages': readingPages,
    };
  }
}
