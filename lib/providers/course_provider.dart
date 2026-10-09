import 'package:flutter/material.dart';
import '../models/course.dart';

class CourseProvider extends ChangeNotifier {
  final List<Course> _courses = [
    Course(
      code: 'CS101',
      title: 'Git & GitHub',
      credits: 3,
      status: 'done',
      isFavorite: false,
    ),
    Course(
      code: 'CS102',
      title: 'Dart Fundamentals',
      credits: 3,
      status: 'done',
      isFavorite: false,
    ),
    Course(
      code: 'CS103',
      title: 'State Management',
      credits: 4,
      status: 'active',
      isFavorite: false,
    ),
  ];

  List<Course> get courses => _courses;

  int get favoriteCount => _courses.where((c) => c.isFavorite).length;

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