import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'repositories/course_repository.dart';
import 'providers/course_provider.dart';
import 'views/home_page.dart';
import 'views/course_list_page.dart';
import 'views/favorites_page.dart';
import 'services/course_data_source.dart';
import 'services/course_api_service.dart';

const String studentName = 'Juberta Kalvarisman Waruwu';
const String studentId = '2415051051';

const String supabaseUrl = 'https://htgpybzpjbasdrpgjtxw.supabase.co';
const String supabasePublishableKey = 'sb_publishable_k7kzet9UuCmGQ_v5Rx-e-w_C733f7VJ';
const String apiBaseUrl = 'https://jsonplaceholder.typicode.com/posts';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Supabase.initialize(
    url: supabaseUrl,
    publishableKey: supabasePublishableKey,
  );

  final CourseDataSource dataSource = CourseApiService(apiBaseUrl);
  final repository = CourseRepository(dataSource);

  runApp(
    ChangeNotifierProvider(
      create: (_) => CourseProvider(repository)..loadCourses(),
      child: const CourseExplorerApp(),
    ),
  );
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

  final List<Widget> pages = [
    const HomePage(
      studentName: studentName,
      studentId: studentId,
    ),
    const CourseListPage(),
    const FavoritesPage(),
  ];

  @override
  Widget build(BuildContext context) {
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
                  '$studentId - $studentName',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            Selector<CourseProvider, int>(
              selector: (context, provider) => provider.favoriteCount,
              builder: (context, favoriteCount, child) {
                return Chip(
                  avatar: const Icon(Icons.favorite, color: Colors.red, size: 16),
                  label: Text('$favoriteCount'),
                );
              },
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
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}