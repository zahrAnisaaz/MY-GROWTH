import 'package:flutter/material.dart';

class BeliPage extends StatefulWidget {
  const BeliPage({super.key});

  @override
  State<BeliPage> createState() => _BeliPageState();
}

class _BeliPageState extends State<BeliPage> {
  String kategori = 'populer';
  String searchQuery = '';

  final List<Map<String, String>> semuaTanaman = [
    {'nama': 'Selada', 'gambar': 'assets/selada.jpg'},
    {'nama': 'Semangka', 'gambar': 'assets/semangka.jpg'},
    {'nama': 'Sawi Putih', 'gambar': 'assets/sawi_putih.jpg'},
    {'nama': 'Melon', 'gambar': 'assets/melon.jpg'},
    {'nama': 'Timun', 'gambar': 'assets/timun.jpg'},
    {'nama': 'Strawberry', 'gambar': 'assets/strawberry.jpg'},
  ];

  final List<String> favoritList = [];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredList = semuaTanaman.where((tanaman) {
      final matchSearch = tanaman['nama']!.toLowerCase().contains(searchQuery.toLowerCase());

      if (kategori == 'populer') {
        return matchSearch && !favoritList.contains(tanaman['nama']);
      } else {
        return matchSearch && favoritList.contains(tanaman['nama']);
      }
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
            // Search Bar
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
              onChanged: (val) {
                setState(() {
                  searchQuery = val;
                });
              },
            ),
            const SizedBox(height: 16),

            // Populer / Favorit Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => kategori = 'populer'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kategori == 'populer' ? Colors.green : Colors.grey,
                  ),
                  child: const Text("POPULER"),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => kategori = 'favorit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kategori == 'favorit' ? Colors.green : Colors.grey,
                  ),
                  child: const Text("FAVORIT"),
                ),
              ],
            ),
            const SizedBox(height: 15),

            // Grid View
            Expanded(
              child: filteredList.isEmpty
                  ? const Center(child: Text("Tanaman tidak ditemukan"))
                  : GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.8,
                      children: filteredList.map((tanaman) {
                        final nama = tanaman['nama']!;
                        final gambar = tanaman['gambar']!;
                        final isFavorit = favoritList.contains(nama);

                        return _buildTanamanItem(
                          nama: nama,
                          gambar: gambar,
                          isFavorit: isFavorit,
                          onFavoriteToggle: () {
                            setState(() {
                              if (isFavorit) {
                                favoritList.remove(nama);
                              } else {
                                favoritList.add(nama);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTanamanItem({
    required String nama,
    required String gambar,
    required bool isFavorit,
    required VoidCallback onFavoriteToggle,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      padding: const EdgeInsets.all(4),
      child: Column(
        children: [
          Image.asset(gambar, height: 90),
          const SizedBox(height: 5),
          Text(nama, style: const TextStyle(fontWeight: FontWeight.bold)),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon: Icon(
                Icons.star,
                color: isFavorit ? Colors.amber : Colors.grey,
              ),
              onPressed: onFavoriteToggle,
            ),
          )
        ],
      ),
    );
  }
}
