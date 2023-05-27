import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled/models/student_model.dart';

import '../models/PostsModel.dart';
import '../utils/constants.dart';

class ApiService {
  static Future<List<StudentModel>> fetchStudents() async {
    final url = Uri.parse('$BASE_URL/v1/user-get');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);

      List<StudentModel> posts =
      jsonData.map((data) => StudentModel.fromJson(data)).toList();

      return posts;
    } else {
      throw Exception('Failed to fetch posts');
    }
  }

  static Future<List<PostsModel>> fetchPosts() async {
    // final url = Uri.parse('$BASE_URL/v1/user-get');
    final url = Uri.parse('$BASE_URL/posts');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);

      List<PostsModel> posts =
      jsonData.map((data) => PostsModel.fromJson(data)).toList();

      return posts;
    } else {
      throw Exception('Failed to fetch posts');
    }
  }
}