import 'package:flutter/material.dart';
import 'Detailpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        elevation: 0,
        title: const Row(
          children: [
            Icon(Icons.menu_book, color: Colors.white),
            SizedBox(width: 10),
            Text(
              'Perpustakaan Kampus',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Buku 1: Pemrograman Flutter
          _buildBookCard(
            context: context,
            title: 'Pemrograman Flutter',
            author: 'Andi Saputra',
            year: '2024',
            category: 'Teknologi',
            description: 'Buku ini membahas dasar hingga praktik membangun aplikasi Flutter.',
            stock: 3,
            imagePath: 'assets/flutter.jpg',
          ),
          const SizedBox(height: 12),

          // Buku 2: Dasar Dart
          _buildBookCard(
            context: context,
            title: 'Dasar Dart',
            author: 'Budi Santoso',
            year: '2023',
            category: 'Pemrograman',
            description: 'Panduan lengkap memahami sintaks dasar dan konsep OOP pada bahasa Dart.',
            stock: 5,
            imagePath: 'assets/dart.jpg',
          ),
          const SizedBox(height: 12),

          // Buku 3: Desain UI/UX
          _buildBookCard(
            context: context,
            title: 'Desain UI/UX',
            author: 'Citra Lestari',
            year: '2022',
            category: 'Desain',
            description: 'Memahami prinsip antarmuka dan pengalaman pengguna untuk aplikasi mobile.',
            stock: 2,
            imagePath: 'assets/design.jpg',
          ),
        ],
      ),
    );
  }

  Widget _buildBookCard({
    required BuildContext context,
    required String title,
    required String author,
    required String year,
    required String category,
    required String description,
    required int stock,
    required String imagePath,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imagePath,
                    width: 70,
                    height: 90,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 70,
                        height: 90,
                        color: Colors.grey[300],
                        child: const Icon(Icons.broken_image, color: Colors.grey),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        author,
                        style: TextStyle(color: Colors.grey[700], fontSize: 13),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Tersedia: $stock Buku',
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Mengirimkan data buku spesifik ke DetailPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        title: title,
                        author: author,
                        year: year,
                        category: category,
                        description: description,
                        stock: stock,
                        imagePath: imagePath,
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Lihat Detail',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}