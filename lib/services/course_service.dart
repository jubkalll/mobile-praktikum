import '../models/course.dart';

class CourseService {
  Future<List<Course>> fetchCourses() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
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
  }
}