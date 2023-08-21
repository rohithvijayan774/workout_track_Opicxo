class UpdateModel {
  int id;
  String date;
  String wakeupTime;
  String gym;
  String meditation;
  String meditationTime;
  String reading;
  String readingPages;

  UpdateModel({
    required this.id,
    required this.date,
    required this.wakeupTime,
    required this.gym,
    required this.meditation,
    required this.meditationTime,
    required this.reading,
    required this.readingPages,
  });

  factory UpdateModel.fromMap(Map<String, dynamic> map) {
    return UpdateModel(
      id: map['person_id'],
      date: map['date'],
      wakeupTime: map['wakeupTime'],
      gym: map['gym'],
      meditation: map['meditation'] ?? '',
      meditationTime: map['meditationTime'] ?? '',
      reading: map['reading'] ?? '',
      readingPages: map['readingPages'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'person_id': id,
      'date': date,
      'wakeupTime': wakeupTime,
      'gym': gym,
      'meditation': meditation,
      'meditationTime': meditationTime,
      'reading': reading,
      'readingPages': readingPages
    };
  }
}
