import 'package:flutter/material.dart';
import '../models/course.dart';
import '../repositories/course_repository.dart';

class CourseProvider extends ChangeNotifier {
  final CourseRepository _repository;

  List<Course> _courses = [];
  bool _isLoading = false;
  String? _error;

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