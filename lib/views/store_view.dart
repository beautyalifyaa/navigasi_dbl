import 'package:flutter/material.dart';
import 'package:flutter_application_3/widgets/bottom_nav.dart';

class StoreView extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {'title': 'ACTIVE CASUAL', 'image': 'jacket_azawear.jpg'},
    {'title': 'BASKETBALL', 'image': 'bola.jpg'},
    {'title': 'DBL MERCHANDISE', 'image': 'dbl_merch.jpg'},
    {'title': 'MULTI SPORTS', 'image': 'tshirt_pink.jpg'},
    {'title': 'FOOTBALL', 'image': 'aza_shoes.jpg'},
    {'title': 'KIDS', 'image': 'aza_kids.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: Text(
    'STORE',
    style: TextStyle(color: Colors.white),  // Mengubah warna teks menjadi putih
  ),
  backgroundColor: Color.fromARGB(255, 12, 104, 178),
  actions: [
    IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart, color: Colors.white)),  // Ubah warna ikon menjadi putih jika diinginkan
  ],
  iconTheme: IconThemeData(
    color: Colors.white,  // Mengubah warna ikon (termasuk tombol back) menjadi putih
  ),
),


      body: SingleChildScrollView(  // Membungkus body dengan SingleChildScrollView
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search product',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            Container(
              height: 200,
              child: PageView(
                children: [
                  Image.asset('azawear_banner.jpg', fit: BoxFit.cover),
                  Image.asset('azawear_banner2.jpg', fit: BoxFit.cover),
                  Image.asset('azawear_banner3.jpg', fit: BoxFit.cover),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            // Memindahkan GridView ke dalam Expanded agar tetap responsive
            Container(
              height: 400,  // Tentukan tinggi yang sesuai untuk GridView
              child: GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.5,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryItem(
                    title: categories[index]['title']!,
                    imagePath: categories[index]['image']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(page: 1), // Set BottomNav dengan index 1 untuk halaman Store
    );
  }
}


class CategoryItem extends StatelessWidget {
  final String title;
  final String imagePath;

  const CategoryItem({required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: 0.7,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
