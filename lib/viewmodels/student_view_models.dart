import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/student_model.dart';

import '../models/PostsModel.dart';
import '../services/api_services.dart';

class StudentViewModel extends ChangeNotifier {
  List<StudentModel> _posts = [];
  List<StudentModel> get posts => _posts;

  Future<void> fetchStudents() async {
    try {
      List<StudentModel> fetchedPosts = await ApiService.fetchStudents();
      _posts = fetchedPosts;
      notifyListeners();
    } catch (e) {
      // Handle error
    }
  }

  List<PostsModel> _posts2 = [];
  List<PostsModel> get posts2 => _posts2;

  Future<void> fetchPosts() async {
    try {
      List<PostsModel> fetchedPosts = await ApiService.fetchPosts();
      _posts2 = fetchedPosts;
      notifyListeners();
    } catch (e) {
      // Handle error
      print(e);
    }
  }
}