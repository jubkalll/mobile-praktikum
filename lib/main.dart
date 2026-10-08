import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tahap 15 - Debugging Challenge',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const DebuggingChallengePage(),
    );
  }
}

class DebuggingChallengePage extends StatefulWidget {
  const DebuggingChallengePage({super.key});

  @override
  State<DebuggingChallengePage> createState() => _DebuggingChallengePageState();
}

class _DebuggingChallengePageState extends State<DebuggingChallengePage> {
  final String studentId = "2415051051";
  final String studentName = "Juberta Kalvarisman Waruwu";

  // Fungsi membaca file JSON dari assets/data/student_data.json
  Future<Map<String, dynamic>> loadJsonData() async {
    final String response = await rootBundle.loadString('assets/data/student_data.json');
    final data = await json.decode(response);
    return Map<String, dynamic>.from(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tahap 15 - Debugging Challenge'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==================== KASUS A ====================
            const Text(
              'Kasus A - Perbaikan RenderFlex Overflow',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    const Icon(Icons.info),
                    const SizedBox(width: 8),
                    // Perbaikan: dibungkus dengan Expanded
                    Expanded(
                      child: Text(
                        '$studentId - $studentName - Ini adalah teks yang sangat panjang untuk menguji layout',
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ==================== KASUS B ====================
            const Text(
              'Kasus B - Penanganan Asset Image',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Image.asset(
                      // Mengarah ke folder assets/images/
                      'assets/images/Gemini_Generated_Image_mr31rwmr31rwmr31.png', 
                      height: 120,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Text(
                          'Aset gambar gagal dimuat. Periksa kembali pubspec.yaml dan nama file.',
                          style: TextStyle(color: Colors.red),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ==================== KASUS C ====================
            const Text(
              'Kasus C - FutureBuilder JSON dengan Error State',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: FutureBuilder<Map<String, dynamic>>(
                  future: loadJsonData(),
                  builder: (context, snapshot) {
                    // State 1: Sedang memuat
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } 
                    // State 2: Terjadi Error (Error State)
                    else if (snapshot.hasError) {
                      return Text(
                        'Error State: Gagal memuat JSON!\nDetail: ${snapshot.error}',
                        style: const TextStyle(color: Colors.red),
                      );
                    } 
                    // State 3: Berhasil memuat data
                    else if (snapshot.hasData) {
                      return Text('Data JSON: ${snapshot.data}');
                    } else {
                      return const Text('Tidak ada data');
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}