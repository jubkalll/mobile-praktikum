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
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: Colors.amber.shade50,
          child: ListTile(
            leading: const Icon(Icons.badge, color: Colors.amber),
            title: Text(studentName),
            subtitle: Text('NIM: $studentId'),
          ),
        ),
      ),
    );
  }
}