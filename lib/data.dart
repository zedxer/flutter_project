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

class User {
  final String name;
  final String email;
  final String password;

  User(this.name, this.email, this.password);
}

Future<List<User>> fetchUsers() async {
  final response =
      await http.get(Uri.parse('http://192.168.1.12:3000/api/v1/user-get'));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    List<User> users = [];
    for (var item in data) {
      users.add(User(
        /*name: item['name'] ?? '',
        email: item['email'] ?? '',
        password: item['password'] ?? '',*/
        item['name'] ?? '',
        item["email"] ?? '',
        item["password"] ?? '',
      ));
    }
    return users;
  } else {
    throw Exception('failed to fetch users');
  }
}
