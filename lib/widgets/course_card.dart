import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String title;
  final String code;
  final int credits;
  final String status;

  const CourseCard({
    super.key,
    required this.title,
    required this.code,
    required this.credits,
    required this.status,
  });

  Color _getStatusColor(String status) {
    switch (status) {
      case 'done':
        return Colors.green;
      case 'active':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade100,
          child: Text(
            '${credits}SKS',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text('Kode: $code'),
        trailing: Chip(
          label: Text(
            status,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          backgroundColor: _getStatusColor(status),
        ),
      ),
    );
  }
}