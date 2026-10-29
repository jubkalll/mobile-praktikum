import 'package:flutter/material.dart';
import '../models/course.dart';
import '../repositories/course_repository.dart';

class CourseProvider extends ChangeNotifier {
  final CourseRepository _repository;

  List<Course> _courses = [];
  bool _isLoading = false;
  bool _isSaving = false;
  String? _error;
  int get favoriteCount => _courses.where((c) => c.isFavorite).length;

  void toggleFavorite(Course course) {
    course.isFavorite = !course.isFavorite;
    notifyListeners();
  }

  CourseProvider(this._repository);

  List<Course> get courses => _courses;
  bool get isLoading => _isLoading;
  bool get isSaving => _isSaving;
  String? get error => _error;

  Future<void> loadCourses() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final fetchedData = await _repository.getCourses();
      _courses = fetchedData.take(5).toList();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createCourse(Course course) async {
    _isSaving = true;
    notifyListeners();

    try {
      await _repository.createCourse(course);
      await loadCourses();
    } catch (e) {
      rethrow;
    } finally {
      _isSaving = false;
      notifyListeners();
    }
  }
}