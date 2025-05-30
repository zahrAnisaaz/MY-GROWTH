import 'package:flutter/material.dart';

class DetailTanamanPage extends StatelessWidget {
  const DetailTanamanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6FB),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("INFO SELADA"),
        actions: const [
          Icon(Icons.star_border),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/selada.png', height: 100),
            const SizedBox(height: 12),
            const Text(
              "INFORMASI SELADA",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Expanded(
              child: SingleChildScrollView(
                child: Text(
                  '''1. Selada adalah sayuran berdaun hijau yang sangat digemari dalam salad.
2. Tanaman ini mudah dibudidayakan secara hidroponik dan tumbuh baik di iklim sejuk.
3. Waktu panen selada biasanya sekitar 30-45 hari setelah tanam.
4. Selada membutuhkan pencahayaan yang baik dan nutrisi yang cukup agar tumbuh optimal.
5. Cocok untuk pemula karena perawatannya relatif mudah.
6. Pastikan pH air antara 5.5-6.5 untuk pertumbuhan maksimal selada.''',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green.shade100,
        selectedItemColor: Colors.green.shade900,
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.inventory), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.local_florist), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: ''),
        ],
      ),
    );
  }
}
