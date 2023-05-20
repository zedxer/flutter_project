import 'package:flutter/material.dart';

import 'data.dart';

void main() {
  runApp(const MyGridView());
}

class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My Grid View"),
        ),
        body: FutureBuilder<List<User>>(
            future: fetchUsers(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                List<User> users = snapshot.data!;
                return GridView.builder(
                    itemCount: users.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5.0,
                      crossAxisSpacing: 5.0,
                      childAspectRatio: 1.0,
                    ),
                    itemBuilder: ((context, index) {
                      User user = users[index];
                      return ListTile(
                        tileColor: Colors.tealAccent,
                        title: Text(user.name),
                        subtitle: Text(user.email),
                      );
                    }));
              } else if (snapshot.hasData) {
                return Text("${snapshot.error}");
              }
              return const CircularProgressIndicator();
            })),
      ),
    );
  }
}
