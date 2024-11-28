import 'package:flutter/material.dart';

void main() {
  runApp(const WildanBiographyApp());
}

class WildanBiographyApp extends StatelessWidget {
  const WildanBiographyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wildan Nursobah Biography',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
      home: const BiographyPage(),
    );
  }
}

class BiographyPage extends StatelessWidget {
  const BiographyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Gradasi Latar Belakang
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF6A11CB), Color.fromARGB(255, 254, 115, 9)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Foto Profil dengan Animasi
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    child: const CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('assets/foto_saya.jpeg'),
                      backgroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Nama dan Deskripsi Singkat
                  const Text(
                    'Wildan Nursobah',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Mahasiswa Ilmu Komputer',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue[100],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),

                  // Informasi Biografi
                  _buildSection(
                    'Biografi',
                    'Saya Wildan Nursobah lahir di Gunung Putri, Kabupaten Bogor, pada 2 Februari 2004, saat ini sedang menempuh pendidikan S1 di bidang Ilmu Komputer. Sebagai seorang mahasiswa, Wil telah menunjukkan kemampuan dan dedikasi yang luar biasa dalam berbagai proyek dan analisis di bidang teknologi dan data. Salah satu pengalaman signifikan Saya adalah menganalisis data penyebaran COVID-19 di provinsi-provinsi Pulau Jawa pada periode 2020–2022. Proyek ini memberikan kontribusi penting dalam memahami pola dan tren pandemi di wilayah tersebut. Selain itu, Wil juga berhasil mengembangkan aplikasi To-Do List berbasis Flutter, yang memiliki fitur-fitur unggulan seperti pengelolaan tugas dengan kategori, prioritas, serta antarmuka pengguna yang menarik. Tidak hanya itu, Saya juga memiliki kemampuan di bidang komputasi visual, dibuktikan dengan keberhasilannya membuat animasi simulasi menggunakan Python. Pada tahun 2023–2024 dan saya turut melakukan analisis tren musik populer di Amerika Serikat dengan memetakan lagu-lagu terpopuler setiap minggunya, memberikan wawasan menarik tentang dunia musik. Dalam hal keahlian teknis, Saya menguasai beberapa bahasa pemrograman, seperti HTML, CSS, PHP, Dart, dan Flutter, yang mendukungnya dalam pengembangan aplikasi web maupun mobile. Dengan latar belakang pendidikan dan pengalamannya yang solid, Saya terus berupaya menjadi individu yang inovatif dan berkontribusi dalam perkembangan teknologi.',
                  ),
                  const SizedBox(height: 24),

                  // Keahlian Teknis
                  _buildSkillsSection(screenWidth),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6A11CB),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black87,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillsSection(double screenWidth) {
    List<String> skills = [
      'HTML', 'CSS', 'PHP', 
      'Dart', 'Flutter', 
      'Python', 'Data Analysis'
    ];

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Keahlian Teknis',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6A11CB),
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: skills.map((skill) {
                return Chip(
                  label: Text(
                    skill,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.blue[50],
                  avatar: const Icon(Icons.check_circle, color: Colors.blue),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
