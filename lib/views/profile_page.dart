import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String studentName;
  final String studentId;

  const ProfilePage({
    super.key,
    required this.studentName,
    required this.studentId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              studentName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(studentId),
          ],
        ),
      ),
    );
  }
}