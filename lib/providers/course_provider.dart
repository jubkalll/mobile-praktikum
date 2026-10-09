import 'package:flutter/material.dart';
import '../models/course.dart';
import '../repositories/course_repository.dart';

class CourseProvider extends ChangeNotifier {
  final CourseRepository _repository;

  List<Course> _courses = [];
  bool _isLoading = false;

  CourseProvider(this._repository) {
    loadCourses();
  }

  List<Course> get courses => _courses;
  bool get isLoading => _isLoading;

  int get favoriteCount => _courses.where((c) => c.isFavorite).length;

  Future<void> loadCourses() async {
    _isLoading = true;
    notifyListeners();

    _courses = await _repository.getCourses();

    _isLoading = false;
    notifyListeners();
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