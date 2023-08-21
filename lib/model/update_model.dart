class UpdateModel {
  int id;
  String date;
  String gym;
  String meditaion;
  String meditationTime;
  String reading;
  String readingPages;

  UpdateModel({
    required this.id,
    required this.date,
    required this.gym,
    required this.meditaion,
    required this.meditationTime,
    required this.reading,
    required this.readingPages,
  });

  factory UpdateModel.fromMap(Map<String, dynamic> map) {
    return UpdateModel(
      id: map['person_id'],
      date: map['date'],
      gym: map['gym'],
      meditaion: map['meditaion'] ?? '',
      meditationTime: map['meditationTime'] ?? '',
      reading: map['reading'] ?? '',
      readingPages: map['readingPages'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'person_id': id,
      'date': date,
      'gym': gym,
      'meditation': meditaion,
      'meditationTime': meditationTime,
      'reading': reading,
      'readingPages': readingPages
    };
  }
}
