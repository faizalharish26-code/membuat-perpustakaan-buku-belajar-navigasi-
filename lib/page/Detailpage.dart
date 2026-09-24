import 'package:flutter/material.dart';
import 'SuccessPage.dart';

class DetailPage extends StatelessWidget {
  final String title;
  final String author;
  final String year;
  final String category;
  final String description;
  final int stock;
  final String imagePath;

  const DetailPage({
    super.key,
    required this.title,
    required this.author,
    required this.year,
    required this.category,
    required this.description,
    required this.stock,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Detail Buku',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: 150,
                height: 190,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 150,
                    height: 190,
                    color: Colors.grey[300],
                    child: const Icon(Icons.broken_image, size: 50, color: Colors.grey),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            _buildInfoRow(Icons.person, 'Penulis', author),
            _buildInfoRow(Icons.calendar_today, 'Tahun Terbit', year),
            _buildInfoRow(Icons.book, 'Kategori', category),
            _buildInfoRow(Icons.list_alt, 'Deskripsi', description),
            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: stock > 0 ? Colors.green[50] : Colors.red[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Tersedia: $stock Buku',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: stock > 0 ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: stock > 0
                    ? () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SuccessPage(),
                    ),
                  );
                }
                    : null,
                icon: const Icon(Icons.menu_book, color: Colors.white),
                label: const Text(
                  'Pinjam Buku',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  side: BorderSide(color: Colors.blue[700]!),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Kembali',
                  style: TextStyle(color: Colors.blue[700], fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: Colors.grey[700]),
          const SizedBox(width: 8),
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: TextStyle(color: Colors.grey[800], fontSize: 14),
            ),
          ),
          Text(
            ': ',
            style: TextStyle(color: Colors.grey[800], fontSize: 14),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}