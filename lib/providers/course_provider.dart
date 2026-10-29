import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/course.dart';
import '../repositories/course_repository.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart'; // Untuk debugPrint

const String apiUrl = 'https://jsonplaceholder.typicode.com/posts';

class CourseProvider extends ChangeNotifier {
  final CourseRepository _repository;

  List<Course> _courses = [];
  bool _isLoading = false;
  String? _error;
  Future<List<Course>> fetchCourses() async {
    final response = await http.get(Uri.parse(apiUrl));
    
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body) as List;
      // Konversi Map JSON menjadi objek Course
      return data.map((e) => Course.fromJson(e as Map<String, dynamic>)).toList();
    }
    
    throw Exception('HTTP ${response.statusCode}');
  }

  Future<void> loadTestData() async {
    try {
      // Ambil 5 data pertama saja untuk ditampilkan di UI
      final fetchedData = await fetchCourses();
      _courses = fetchedData.take(5).toList();
      notifyListeners();
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  CourseProvider(this._repository) {
    loadCourses();
  }

  List<Course> get courses => _courses;
  bool get isLoading => _isLoading;
  String? get error => _error;

  int get favoriteCount => _courses.where((c) => c.isFavorite).length;

  Future<void> loadCourses() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _courses = await _repository.getCourses();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void toggleFavorite(String code) {
    final index = _courses.indexWhere((element) => element.code == code);
    if (index != -1) {
      _courses[index].isFavorite = !_courses[index].isFavorite;
      notifyListeners();
    }
  }

  void addCourse(Course course) {
    _courses.add(course);
    notifyListeners();
  }
}