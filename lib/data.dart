// class Book {
//   final String title;
//   final String author;
//   final int publicationYear;

//   Book(this.title, this.author, this.publicationYear);
// }

// List<Book> bookList = [
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
//   Book("Meow", "Cat", 2003),
// ];

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'models/student_model.dart';

class User {
  final String name;
  final String email;
  final String password;
  final String percentage;

  User(this.name, this.email, this.password, this.percentage);
}

// Future<List<User>> fetchUsers() async {
//   final response = await http.get(
//     Uri.parse('http://192.168.1.12:3000/api/v1/user-get'),
//   );
//   if (response.statusCode == 200) {
//     final data = jsonDecode(response.body);
//     List<User> users = [];
//     for (var item in data) {
//       users.add(User(
//           /*name: item['name'] ?? '',
//         email: item['email'] ?? '',
//         password: item['password'] ?? '',*/
//           item['name'] ?? '',
//           item["email"] ?? '',
//           item["password"] ?? '',
//           item["percentage"]));
//     }
//     return users;
//   } else {
//     throw Exception('failed to fetch users');
//   }
// }
Future<List<StudentModel>> fetchStudents() async {
  final url = Uri.parse('api/getstudents');

  final response = await http.get(url);

  if (response.statusCode.isBetween(200, 299)) {

    final List<dynamic> jsonData = jsonDecode(response.body);

    List<StudentModel> students = jsonData.map((data) => StudentModel.fromJson(data)).toList();

    return students;
  } else {
    throw Exception('Failed to fetch students');
  }
}
//
