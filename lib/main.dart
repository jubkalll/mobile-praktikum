import 'package:flutter/material.dart';
import 'models/course.dart';
import 'views/home_page.dart';
import 'views/course_list_page.dart';
import 'views/profile_page.dart';

const String studentName = 'Juberta Kalvarisman Waruwu';
const String studentId = '2415051051';

void main() {
  runApp(const CourseExplorerApp());
}

class CourseExplorerApp extends StatelessWidget {
  const CourseExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course Explorer v2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  List<Course> courses = [
    Course(
      code: 'CS101',
      title: 'Git & GitHub',
      credits: 3,
      status: 'done',
      isFavorite: false,
    ),
    Course(
      code: 'CS102',
      title: 'Dart Fundamentals',
      credits: 3,
      status: 'done',
      isFavorite: false,
    ),
    Course(
      code: 'CS103',
      title: 'State Management',
      credits: 4,
      status: 'active',
      isFavorite: false,
    ),
  ];

  void _toggleFavorite(String code) {
    setState(() {
      final index = courses.indexWhere((element) => element.code == code);
      if (index != -1) {
        courses[index].isFavorite = !courses[index].isFavorite;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomePage(
        studentName: studentName,
        studentId: studentId,
        totalCourses: courses.length,
      ),
      CourseListPage(
        courses: courses,
        onToggleFavorite: _toggleFavorite,
      ),
      ProfilePage(
        studentName: studentName,
        studentId: studentId,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Course Explorer v2',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              '$studentId • $studentName',
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}