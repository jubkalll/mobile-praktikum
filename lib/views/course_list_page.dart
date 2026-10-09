import 'package:flutter/material.dart';
import '../models/course.dart';
import 'add_course_page.dart';

class CourseListPage extends StatelessWidget {
  final List<Course> courses;
  final Function(int) onToggleFavorite;
  final Function(Course) onAddCourse;

  const CourseListPage({
    super.key,
    required this.courses,
    required this.onToggleFavorite,
    required this.onAddCourse,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Matakuliah TI'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newCourse = await Navigator.push<Course>(
            context,
            MaterialPageRoute(builder: (_) => const AddCoursePage()),
          );
          if (newCourse != null) {
            onAddCourse(newCourse);
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Matakuliah "${newCourse.title}" berhasil ditambahkan!'),
                  backgroundColor: Colors.green,
                ),
              );
            }
          }
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(course.code.length >= 3 ? course.code.substring(3) : course.code),
              ),
              title: Text(
                course.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${course.code} • ${course.credits} SKS'),
              trailing: IconButton(
                icon: Icon(
                  course.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: course.isFavorite ? Colors.red : Colors.grey,
                ),
                onPressed: () => onToggleFavorite(index),
              ),
            ),
          );
        },
      ),
    );
  }
}