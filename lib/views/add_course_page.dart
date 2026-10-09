import 'package:flutter/material.dart';
import '../models/course.dart';

class AddCoursePage extends StatefulWidget {
  final Function(Course) onAddCourse;

  const AddCoursePage({
    super.key,
    required this.onAddCourse,
  });

  @override
  State<AddCoursePage> createState() => _AddCoursePageState();
}

class _AddCoursePageState extends State<AddCoursePage> {
  final _codeController = TextEditingController();
  final _titleController = TextEditingController();
  final _creditsController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
    _titleController.dispose();
    _creditsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Course'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _codeController,
              decoration: const InputDecoration(labelText: 'Course Code'),
            ),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _creditsController,
              decoration: const InputDecoration(labelText: 'Credits'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_codeController.text.isNotEmpty &&
                    _titleController.text.isNotEmpty) {
                  final newCourse = Course(
                    code: _codeController.text,
                    title: _titleController.text,
                    credits: int.tryParse(_creditsController.text) ?? 3,
                    status: 'active',
                  );
                  widget.onAddCourse(newCourse);
                  Navigator.pop(context);
                }
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}