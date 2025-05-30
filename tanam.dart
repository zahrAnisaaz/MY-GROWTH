import 'package:flutter/material.dart';
import 'detail_tanaman.dart';

class TanamPage extends StatefulWidget {
  const TanamPage({super.key});

  @override
  State<TanamPage> createState() => _TanamPageState();
}

class _TanamPageState extends State<TanamPage> {
  String kategori = 'pendek';
  String searchQuery = '';

  final List<Map<String, String>> semuaTanaman = [
    {'nama': 'Selada', 'gambar': 'assets/selada.jpg', 'kategori': 'pendek'},
    {'nama': 'Kangkung', 'gambar': 'assets/kangkung.jpg', 'kategori': 'pendek'},
    {'nama': 'Bayam', 'gambar': 'assets/bayam.jpg', 'kategori': 'pendek'},
    {'nama': 'Durian', 'gambar': 'assets/tomato.jpg', 'kategori': 'panjang'},
    {'nama': 'Melon', 'gambar': 'assets/melon.jpg', 'kategori': 'panjang'},
    {'nama': 'Mangga', 'gambar': 'assets/strawberry.jpg', 'kategori': 'panjang'},
  ];

  @override
  Widget build(BuildContext context) {
    // Filter berdasarkan kategori dan search
    final List<Map<String, String>> tanamanTampil = semuaTanaman.where((tanaman) {
      final cocokKategori = tanaman['kategori'] == kategori;
      final cocokSearch = tanaman['nama']!.toLowerCase().contains(searchQuery.toLowerCase());
      return cocokKategori && cocokSearch;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF9F6FB),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("TANAMAN HIDROPONIK"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Search bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
            const SizedBox(height: 16),

            // Kategori
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      kategori = 'pendek';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kategori == 'pendek' ? Colors.green : Colors.grey,
                  ),
                  child: const Text("JANGKA PENDEK"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      kategori = 'panjang';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kategori == 'panjang' ? Colors.green : Colors.grey,
                  ),
                  child: const Text("JANGKA PANJANG"),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Daftar tanaman
            Expanded(
              child: tanamanTampil.isEmpty
                  ? const Center(child: Text("Tanaman tidak ditemukan"))
                  : GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      children: tanamanTampil.map((tanaman) {
                        return _buildTanamanItem(context, tanaman['nama']!, tanaman['gambar']!);
                      }).toList(),
                    ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTanamanItem(BuildContext context, String name, String imagePath) {
    return GestureDetector(
      onTap: () {
        if (name == 'Selada') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const DetailTanamanPage()),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 60),
            const SizedBox(height: 8),
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
