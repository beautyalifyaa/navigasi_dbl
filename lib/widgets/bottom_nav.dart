import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  final int page;

  BottomNav({Key? key, required this.page}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  void getPage(int index) {
    if (widget.page == index) return; // Menghindari navigasi ulang jika index tidak berubah

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/store');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/academy');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Membatasi currentIndex dalam rentang 0 hingga 3 agar selalu valid
    int currentIndex = widget.page.clamp(0, 3);

    return BottomNavigationBar(
      selectedItemColor: const Color.fromARGB(255, 102, 167, 220),
      unselectedItemColor: Colors.grey,
      currentIndex: currentIndex,
      onTap: getPage,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.store), label: "Store"),
        BottomNavigationBarItem(icon: Icon(Icons.shield), label: "Academy"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
