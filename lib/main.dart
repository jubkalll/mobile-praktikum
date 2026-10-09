import 'package:flutter/material.dart';
import 'providers/course_provider.dart';
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
  final CourseProvider _courseProvider = CourseProvider();

  @override
  void dispose() {
    _courseProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _courseProvider,
      builder: (context, child) {
        final List<Widget> pages = [
          HomePage(
            studentName: studentName,
            studentId: studentId,
            totalCourses: _courseProvider.courses.length,
          ),
          CourseListPage(
            courses: _courseProvider.courses,
            onToggleFavorite: _courseProvider.toggleFavorite,
          ),
          ProfilePage(
            studentName: studentName,
            studentId: studentId,
          ),
        ];

        return Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
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
                Chip(
                  avatar: const Icon(Icons.favorite, color: Colors.red, size: 16),
                  label: Text('${_courseProvider.favoriteCount}'),
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
      },
    );
  }
}