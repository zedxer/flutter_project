import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ListViewExample extends StatefulWidget {
  const ListViewExample({super.key, required this.title});

  final String title;

  @override
  State<ListViewExample> createState() => _ListViewExampleState();
}

class _ListViewExampleState extends State<ListViewExample> {
  List<Student>? students;
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                decoration: const InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  var studentItem = students![index];
                  return GestureDetector(
                    onTap: () {
                      if (kDebugMode) {
                        print(students![index].name);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
                        elevation: 5,
                        color: Colors.white.withOpacity(0.5),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 200,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(studentItem.name.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                    Text(studentItem.email.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14)),
                                    Text(
                                      studentItem.phone.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      "Grade: ${studentItem.grade.toString()} ",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: students == null ? 0 : students!.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getStudents();
  }

  final duplicateItems = <Student>[];

  void filterSearchResults(String query) {
    List<Student> dummySearchList = <Student>[];
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<Student> dummyListData = <Student>[];
      for (var item in dummySearchList) {
        if ((item.name.toLowerCase().contains(query.toLowerCase())) ||
            (item.phone.toLowerCase().contains(query.toLowerCase())) ||
            // (item.language.contains(query.toLowerCase()))
            (item.language.any((lang) => lang.toLowerCase().contains(query
                .toLowerCase()))) /*||
              (item.grade.toLowerCase().contains(query.toLowerCase())) ||
              (item.email.toLowerCase().contains(query.toLowerCase()))*/
        ) {
          dummyListData.add(item);
        }
      }
      setState(() {
        students?.clear();
        students?.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        students?.clear();
        students?.addAll(duplicateItems);
      });
    }
  }

  Future<void> getStudents() async {
    students = await StudentsService.getStudents();
    duplicateItems.addAll(students!);
    setState(() {
      if (kDebugMode) {
        print(students!);
        print("Student fetched");
      }
    });
  }
}

class StudentsService {
  static getStudents() => [
    Student(
        id: "123",
        name: "Naqi",
        phone: "03422152503",
        email: "naqi@google.com",
        language: ["english", "punjabi", "urdu"],
        grade: "A"),
    Student(
        id: "321",
        name: "Ahsan",
        phone: "03422642503",
        email: "ahsan@facebook.com",
        language: ["urdu", "english"],
        grade: "B"),
    Student(
        id: "122",
        name: "Sumair",
        phone: "03422322503",
        email: "sumair@amazon.com",
        language: ["urdu", "sindhi", "english"],
        grade: "C"),
  ];
}

class Student {
  Student(
      {required this.id,
        required this.name,
        required this.phone,
        required this.email,
        required this.language,
        required this.grade,
        this.pictureUrl});

  String? id;
  String name;
  String phone;
  String email;
  List<String> language;
  String grade;
  String? pictureUrl;
}