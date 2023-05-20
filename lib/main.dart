import 'package:flutter/material.dart';

import 'data.dart';
import 'gesture_detector.dart';
import 'listview_with_searching.dart';

void main() {
  runApp(const ListViewDataExample());
}

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
          // body: ListView.builder(
          //   itemCount: bookList.length,
          //   itemBuilder: (context, index) {
          //     Book book = bookList[index];
          //     return ListTile(
          //       title: Text(book.title),
          //       subtitle: Text("${book.author}, ${book.publicationYear}"),
          //     );
          //   },
          // body: MyGestureDetector(),
          body: const ListViewExample(
            title: 'List Example',
          )
          // body: FutureBuilder<List<User>>(
          //   future: fetchUsers(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       List<User> users = snapshot.data!;
          //       return ListView.builder(
          //         itemCount: users.length,
          //         itemBuilder: (context, index) {
          //           User user = users[index];
          //           return ListTile(
          //             title: Text(user.name),
          //             subtitle: Text(user.email),
          //           );
          //         },
          //       );
          //     } else if (snapshot.hasError) {
          //       return Text('Error: ${snapshot.error}');
          //     }
          //     return const CircularProgressIndicator();
          //   },
          // ),
          ),
    );
  }
}
