import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/course_provider.dart';
import '../widgets/course_card.dart';
import '../widgets/error_view.dart';
import 'add_course_page.dart';

class CourseListPage extends StatelessWidget {
  const CourseListPage({super.key});

@override
  Widget build(BuildContext context) {
    final provider = context.watch<CourseProvider>();
    if (provider.isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (provider.error != null) {
      return ErrorView(
        message: provider.error!,
        onRetry: provider.loadCourses, 
      );
    }

    if (provider.courses.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Data course belum tersedia'),
        ),
      );
    }

    // 4. Success State (Menampilkan list data)
    return Column(
      children: [
        // Tombol Tambah Course
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddCoursePage()),
              );
            },
            icon: const Icon(Icons.add),
            label: const Text('Tambah Course'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50), // Lebar penuh
              backgroundColor: Colors.teal.shade50,
              foregroundColor: Colors.teal.shade900,
              elevation: 0,
            ),
          ),
        ),
        
        // List Course
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: provider.courses.length,
          itemBuilder: (context, index) {
            final course = provider.courses[index];
            return CourseCard(course: course); 
          },
        ),
      ],
    );
  }
}