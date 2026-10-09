import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/course.dart';
import '../providers/course_provider.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(
          course.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          course.status,
          style: TextStyle(
            color: course.status == 'done' ? Colors.green : Colors.teal,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: IconButton(
          icon: Icon(
            course.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: course.isFavorite ? Colors.red : null,
          ),
          onPressed: () {
            context.read<CourseProvider>().toggleFavorite(course.code);
          },
        ),
      ),
    );
  }
}