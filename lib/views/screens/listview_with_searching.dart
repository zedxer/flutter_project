import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ListViewWithSearchExample extends StatefulWidget {
  const ListViewWithSearchExample({super.key, required this.title});

  final String title;

  @override
  State<ListViewWithSearchExample> createState() =>
      _ListViewWithSearchExampleState();
}

class _ListViewWithSearchExampleState extends State<ListViewWithSearchExample> {
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
                      Navigator.pushNamed(
                        context,
                        '/b',
                        arguments: 'Hello from HomePage',
                      );
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
                                    ),
                                    getIcons(studentItem.percentage),
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

  Widget getIcons(double percetage) {
    if (percetage.isBetween(95.0, 100.0)) {
      return const Icon(
        Icons.star,
        color: Colors.green,
        size: 30.0,
      );
    } else if (percetage.isBetween(75.0, 95.0)) {
      return const Icon(
        Icons.check,
        color: Colors.green,
        size: 30.0,
      );
    } else if (percetage.isBetween(60.0, 75.0)) {
      return const Icon(
        Icons.arrow_circle_left,
        color: Colors.green,
        size: 30.0,
      );
    } else {
      return const Icon(
        Icons.close,
        color: Colors.red,
        size: 30.0,
      );
    }
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
            percentage: 96.0,
            language: ["english", "punjabi", "urdu"],
            grade: "A"),
        Student(
            id: "321",
            name: "Ahsan",
            phone: "03422642503",
            email: "ahsan@facebook.com",
            percentage: 65.0,
            language: ["urdu", "english"],
            grade: "B"),
        Student(
            id: "122",
            name: "Sumair",
            phone: "03422322503",
            email: "sumair@amazon.com",
            percentage: 0.0,
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
      required this.percentage,
      required this.language,
      required this.grade,
      this.pictureUrl});

  String? id;
  String name;
  String phone;
  String email;
  double percentage;
  List<String> language;
  String grade;
  String? pictureUrl;
}
extension RangeCheck on num {
  bool isBetween(num from, num to) {
    return from <= this && this <= to;
  }
}
