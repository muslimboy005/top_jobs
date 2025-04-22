import 'package:flutter/material.dart';

class FillAdminProfileScreen extends StatelessWidget {
  const FillAdminProfileScreen({Key? key})
    : super(key: key);

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Ma'lumot"),
            content: const Text(
              "Shaxsiy ma'lumotlarni to'ldirish uchun davom eting.",
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Yopish"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal, Colors.tealAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 50,
        ),
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Image
                  Image.network(
                    'https://www.shutterstock.com/shutterstock/photos/1049534216/display_1500/stock-vector-congratulations-typography-lettering-handwritten-vector-for-greeting-1049534216.jpg',
                    height: 200,
                  ),
                  const SizedBox(height: 20),
                  // Text
                  const Text(
                    "🎉 Tabriklaymiz!\n\nRo'yxatdan o'tdingiz. Endi Kompaniya Malumotlarini to'ldirishingiz kerak.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal.shade700,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () => _showInfoDialog(context),
            icon: const Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 35,
            ),
            label: const Text(
              " Boshlash",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
