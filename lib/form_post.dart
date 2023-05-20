import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    fetchUserList();
  }

  Future<void> fetchUserList() async {
    try {
      final users = await fetchUsers();
      setState(() {
        _users = users;
      });
    } catch (e) {
      print('Error fetching users: $e');
    }
  }

  Future<void> createUser(User user) async {
    final response = await http.post(
      Uri.parse('http://192.168.0.101:3000/api/v1/user-post'),
      // headers: <String, String>{
      //   'Content-Type': 'application/json',
      // },
      body: jsonEncode(<String, dynamic>{
        'name': user.name,
        'email': user.email,
        'password': user.password,
      }),
    );
    if (response.statusCode == 201) {
      print('User created successfully');
    } else {
      throw Exception('Failed to create user');
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('User List'),
        ),
        body: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter an email';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final newUser = User(
                          _nameController.text,
                          _emailController.text,
                          _passwordController.text,
                        );
                        createUser(newUser);
                      }
                    },
                    child: const Text('Create User'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _users.length,
                itemBuilder: (context, index) {
                  final user = _users[index];
                  return ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.email),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  final String name;
  final String email;
  final String password;

  User(this.name, this.email, this.password);
}

Future<List<User>> fetchUsers() async {
  final response =
      await http.get(Uri.parse('http://192.168.0.101:3000/api/v1/user-get'));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    List<User> users = [];
    for (var item in data) {
      users.add(User(
        item['name'] ?? '',
        item["email"] ?? '',
        item["password"] ?? '',
      ));
    }
    return users;
  } else {
    throw Exception('Failed to fetch users');
  }
}

void main() {
  runApp(MyApp());
}
