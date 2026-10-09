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
      appBar: AppBar(
        title: const Text('Home Dashboard'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.blue.shade50,
              child: ListTile(
                leading: const Icon(Icons.person, color: Colors.blue),
                title: Text('$studentId - $studentName'),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              color: Colors.lightGreen.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(Icons.book, size: 40, color: Colors.green),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Total Matakuliah Terdaftar',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '$totalCourses Matakuliah',
                          style: const TextStyle(fontSize: 18, color: Colors.green),
                        ),
                      ],
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