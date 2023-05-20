import 'dart:convert';

class StudentModel {
  StudentModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.language,
    required this.grade,
    this.pictureUrl,
  });

  String? id;
  String name;
  String phone;
  String email;
  List<String> language;
  String grade;
  String? pictureUrl;

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      language: List<String>.from(json['language']),
      grade: json['grade'],
      pictureUrl: json['pictureUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'language': language,
      'grade': grade,
      'pictureUrl': pictureUrl,
    };
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }

  static StudentModel fromJsonString(String jsonString) {
    Map<String, dynamic> json = jsonDecode(jsonString);
    return StudentModel.fromJson(json);
  }
}
