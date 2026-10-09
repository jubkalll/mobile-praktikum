import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/course.dart';
import '../providers/course_provider.dart';

class AddCoursePage extends StatefulWidget {
  const AddCoursePage({super.key});

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
        title: const Text('Tambah Mata Kuliah'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _codeController,
              decoration: const InputDecoration(labelText: 'Kode Mata Kuliah'),
            ),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Nama Mata Kuliah'),
            ),
            TextField(
              controller: _creditsController,
              decoration: const InputDecoration(labelText: 'SKS'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_codeController.text.isNotEmpty &&
                    _titleController.text.isNotEmpty) {
                  final newCourse = Course(
                    code: _codeController.text,
                    title: _titleController.text,
                    credits: int.tryParse(_creditsController.text) ?? 3,
                    status: 'active',
                  );

                  context.read<CourseProvider>().addCourse(newCourse);

                  // Solusi Kasus D: Periksa mounted sebelum menggunakan context setelah operasi async/state
                  if (!mounted) return;
                  Navigator.pop(context);
                }
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}