import 'package:flutter/material.dart';
import 'views/debugging_page.dart';

const String studentName = 'Juberta Kalvarisman Waruwu';
const String studentId = '2415051051';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tahap 16 - Debugging Challenge',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const DebuggingPage(
        studentName: studentName,
        studentId: studentId,
      ),
    );
  }
}