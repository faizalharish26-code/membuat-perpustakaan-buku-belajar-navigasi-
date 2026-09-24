import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  final String title;

  const SuccessPage({
    super.key,
    this.title = 'Pemrograman Flutter',
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
          'Peminjaman Buku',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 10),

            SizedBox(
              width: 180,
              height: 140,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/selesai.png',
                    width: 170,
                    height: 130,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.library_books_rounded,
                        size: 100,
                        color: Colors.blue,
                      );
                    },
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 48,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            const Text(
              'Peminjaman Berhasil!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Buku "$title"\nberhasil dipinjam.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[700], fontSize: 14),
            ),
            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_month, color: Colors.grey[800]),
                      const SizedBox(width: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Tanggal Pinjam', style: TextStyle(fontSize: 13, color: Colors.grey)),
                          Text('10 Maret 2026', style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                  const Divider(height: 24),
                  Row(
                    children: [
                      Icon(Icons.access_time, color: Colors.grey[800]),
                      const SizedBox(width: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Batas Pengembalian', style: TextStyle(fontSize: 13, color: Colors.grey)),
                          Text('17 Maret 2026', style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

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
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.home, color: Colors.white),
                label: const Text(
                  'Kembali ke Beranda',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}