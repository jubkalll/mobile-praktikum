import 'package:flutter/material.dart';
import '../models/course.dart';
import '../widgets/course_card.dart';

class CourseListPage extends StatelessWidget {
  final List<Course> courses;
  final Function(String) onToggleFavorite;

  const CourseListPage({
    super.key,
    required this.courses,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return CourseCard(
            course: course,
            onToggleFavorite: () => onToggleFavorite(course.code),
          );
        },
      ),
    );
  }
}