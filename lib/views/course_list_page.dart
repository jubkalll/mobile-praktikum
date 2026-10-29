import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/course_provider.dart';
import '../widgets/course_card.dart';
import '../widgets/error_view.dart';

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
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // Menghindari bentrok scroll dengan home_page
      itemCount: provider.courses.length,
      itemBuilder: (context, index) {
        final course = provider.courses[index];
        // Pastikan Anda mem-passing parameter yang benar sesuai CourseCard Anda
        return CourseCard(course: course); 
      },
    );
  }
}