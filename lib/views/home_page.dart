import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String studentName;
  final String studentId;
  final int totalCourses;

  const HomePage({
    super.key,
    required this.studentName,
    required this.studentId,
    required this.totalCourses,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: ListTile(
                title: Text('$studentId • $studentName'),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text('Courses'),
                    Text(
                      '$totalCourses',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}