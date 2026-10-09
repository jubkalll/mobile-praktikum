import 'package:flutter/material.dart';

class DebuggingPage extends StatefulWidget {
  final String studentName;
  final String studentId;

  const DebuggingPage({
    super.key,
    required this.studentName,
    required this.studentId,
  });

  @override
  State<DebuggingPage> createState() => _DebuggingPageState();
}

class _DebuggingPageState extends State<DebuggingPage> {
  bool isNavigating = false;

  void _handleSafeNavigation() async {
    if (isNavigating) return;
    setState(() {
      isNavigating = true;
    });

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('Detail Screen')),
          body: const Center(child: Text('Halaman Hasil Navigasi')),
        ),
      ),
    );

    setState(() {
      isNavigating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tahap 16: Debugging Challenge'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Kasus A: Perbaikan RenderFlex Overflow',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Card(
              color: Colors.blue.shade50,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    const Icon(Icons.info, color: Colors.blue),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '${widget.studentId} - ${widget.studentName} - teks sangat panjang yang tidak akan mengalami overflow karena dibungkus Expanded.',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'Kasus B: Perbaikan Vertical Viewport Unbounded Height',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(child: Text('${index + 1}')),
                      title: Text('Item Matakuliah #${index + 1}'),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'Kasus C & D: Form Bottom & Pencegahan Navigasi Ganda',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Uji Input Form (Kasus C)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.edit),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: isNavigating ? null : _handleSafeNavigation,
                icon: const Icon(Icons.arrow_forward),
                label: Text(
                  isNavigating ? 'Memproses...' : 'Buka Halaman (Kasus D)',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}