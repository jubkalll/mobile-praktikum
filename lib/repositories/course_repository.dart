import '../models/course.dart';
import '../services/course_service.dart';

class CourseRepository {
  final CourseService _service;

  CourseRepository(this._service);

  Future<List<Course>> getCourses() async {
    return await _service.fetchCourses();
  }
}