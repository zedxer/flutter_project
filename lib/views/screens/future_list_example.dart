import 'package:flutter/material.dart';

import '../../data.dart';

class ListViewDataExample extends StatefulWidget {
  const ListViewDataExample({super.key});

  @override
  State<ListViewDataExample> createState() => _ListViewDataExampleState();
}

class _ListViewDataExampleState extends State<ListViewDataExample> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("List View"),
        ),
        body: FutureBuilder<List<User>>(
          future: fetchUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<User> users = snapshot.data!;
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  User user = users[index];
                  return ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.email),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
