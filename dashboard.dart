import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'beli.dart';
import 'tanam.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6FB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.green,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.amber[400],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('HI JAMAL !!', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Selamat Pagi', style: TextStyle(fontSize: 12, color: Colors.white)),
                          Text('Jangan lupa cek tanamanmu ya', style: TextStyle(fontSize: 10, color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Icon(Icons.notifications),
                  const SizedBox(width: 8),
                  const Icon(Icons.person_outline),
                ],
              ),
              const SizedBox(height: 16),

              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Kalender
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                ),
                child: TableCalendar(
                  focusedDay: DateTime(2025, 8, 1),
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  calendarStyle: CalendarStyle(
                    weekendTextStyle: const TextStyle(color: Colors.red),
                    todayDecoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Pilih Beli / Tanam
              const Text('MAU BELI ATAU TANAM?', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const BeliPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: const Text('BELI'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const TanamPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: const Text('TANAM'),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Tanaman Anda
              const Text('TANAMAN ANDA', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 16,
                          backgroundImage: AssetImage('assets/tomato.jpg'),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('✅ PENGECEKAN TANAMAN'),
                              Text('✅ PERAWATAN TANAMAN'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 16,
                          backgroundImage: AssetImage('assets/bayam.jpg'),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('⬜ PENGECEKAN TANAMAN'),
                              Text('⬜ PERAWATAN TANAMAN'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation
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




// import 'package:flutter/material.dart';
// import 'beli.dart'; // buat file ini nanti ya

// class DashboardPage extends StatelessWidget {
//   const DashboardPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF9F6FB),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Header
//               Row(
//                 children: [
//                   const CircleAvatar(
//                     radius: 24,
//                     backgroundColor: Colors.green,
//                     child: Icon(Icons.person, color: Colors.white),
//                   ),
//                   const SizedBox(width: 12),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: const [
//                       Text('Hi JAMAL !!', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                       Text('Selamat Pagi', style: TextStyle(color: Colors.black54)),
//                       Text('Jangan lupa cek tanamanmu ya', style: TextStyle(fontSize: 12, color: Colors.orange)),
//                     ],
//                   ),
//                   const Spacer(),
//                   const Icon(Icons.notifications),
//                 ],
//               ),
//               const SizedBox(height: 16),

//               // Search bar
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Search',
//                   filled: true,
//                   fillColor: Colors.white,
//                   prefixIcon: const Icon(Icons.search),
//                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
//                 ),
//               ),
//               const SizedBox(height: 16),

//               // Calendar dummy
//               Container(
//                 height: 150,
//                 width: double.infinity,
//                 color: Colors.white,
//                 alignment: Alignment.center,
//                 child: const Text('Kalender Tanam (Dummy)', style: TextStyle(color: Colors.grey)),
//               ),
//               const SizedBox(height: 16),

//               // Tombol beli / tanam
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (_) => const BeliPage()),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green,
//                       padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//                     ),
//                     child: const Text('BELI'),
//                   ),
//                   const SizedBox(width: 20),
//                   ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green,
//                       padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//                     ),
//                     child: const Text('TANAM'),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),

//               // Daftar tanaman user (dummy)
//               const Text('TANAMAN ANDA', style: TextStyle(fontWeight: FontWeight.bold)),
//               const SizedBox(height: 8),
//               Container(
//                 padding: const EdgeInsets.all(12),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Text('✅ Pengecekan Tanaman'),
//                     Text('✅ Perawatan Tanaman'),
//                     SizedBox(height: 8),
//                     Text('🟩 Pengecekan Tanaman'),
//                     Text('🟩 Perawatan Tanaman'),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'beli.dart';

// class DashboardPage extends StatelessWidget {
//   const DashboardPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: 0,
//         selectedItemColor: Colors.green,
//         unselectedItemColor: Colors.grey,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.eco), label: 'Tanam'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
//         ],
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               // Header pengguna
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.amber[200],
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 padding: const EdgeInsets.all(12),
//                 child: Row(
//                   children: [
//                     const CircleAvatar(radius: 24, backgroundColor: Colors.white),
//                     const SizedBox(width: 10),
//                     const Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('HI JAMAL !!', style: TextStyle(fontWeight: FontWeight.bold)),
//                           Text('Selamat Pagi\nJangan lupa cek tanamanmu ya'),
//                         ],
//                       ),
//                     ),
//                     Icon(Icons.notifications, color: Colors.black),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Search bar
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: "Search",
//                   prefixIcon: const Icon(Icons.search),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Kalender (placeholder)
//               Container(
//                 height: 150,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[300],
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 alignment: Alignment.center,
//                 child: const Text("Kalender", style: TextStyle(fontSize: 18)),
//               ),
//               const SizedBox(height: 20),

//               // Tombol Beli dan Tanam
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (_) => const BeliPage()));
//                     },
//                     child: const Text("BELI"),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green,
//                       foregroundColor: Colors.white,
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                     ),
//                   ),
//                   const SizedBox(width: 20),
//                   ElevatedButton(
//                     onPressed: () {
//                       // nanti bisa diarahkan ke halaman tanam
//                     },
//                     child: const Text("TANAM"),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green,
//                       foregroundColor: Colors.white,
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),

//               // Daftar aktivitas tanaman
//               const ListTile(
//                 leading: Icon(Icons.check_circle, color: Colors.green),
//                 title: Text("Pengecekan Tanaman"),
//               ),
//               const ListTile(
//                 leading: Icon(Icons.eco, color: Colors.green),
//                 title: Text("Perawatan Tanaman"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
