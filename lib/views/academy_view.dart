import 'package:flutter/material.dart';
import 'package:flutter_application_3/widgets/bottom_nav.dart';
import 'package:flutter_application_3/widgets/chart.dart';

class AcademyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  backgroundColor: Color.fromARGB(255, 12, 104, 178),
  leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.white), // Set icon color to white
    onPressed: () {
      Navigator.pushReplacementNamed(context, '/'); // Replace '/' with the route to your home page
    },
  ),
  title: Text(
    'Profile',
    style: TextStyle(color: Colors.white),
  ),
),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'dbl_academy.jpg', // Replace with your asset path
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 20,
                  top: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'DBL Academy',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
  onPressed: () {
    // Navigasi ke ChartWidget setelah tombol ditekan
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChartWidget()),
    );
  },
  child: Text('Join Now'),
),

                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCategoryButton('PRE-HOOPS', '3-4 Years old'),
                      SizedBox(width: 20), // Add space between buttons
                    _buildCategoryButton('HOOPS KIDS', '5-6 Years old'),
                      SizedBox(width: 20), // Add space between buttons
                    _buildCategoryButton('HOOPS', '7-9 Years old'),
                      SizedBox(width: 20), // Add space between buttons
                    _buildCategoryButton('ROOKIE', '10-12 Years old'),
                      SizedBox(width: 20), // Add space between buttons
                    _buildCategoryButton('STARTER', '13-15 Years old'),
                      SizedBox(width: 20), // Add space between buttons
                    _buildCategoryButton('ELITE', '16-18 Years old'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionHeader('Information'),
                  _buildInformationTile(
                    'Nutrition Class : Pentingnya Menjaga Keseimbangan Cairan Tubuh Bagi Atlet Basket',
                    '07 Februari 2024',
                    'nutrition_class.jpg', // Replace with your asset path
                  ),
                  _buildInformationTile(
                    'Peduli Tumbuh Kembang Anak, DBL Academy Gelar Parents Gathering',
                    '29 Januari 2024',
                    'parents_gathering.jpg', // Replace with your asset path
                  ),
                  _buildInformationTile(
                    'DBL Academy Resmi Hadir di Surabaya Timur, Dibuka di Pakuwon City Mall',
                    '29 Januari 2024',
                    'dbl_academy_banner.jpg', // Replace with your asset path
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _buildSectionHeader('Gallery'),
            ),
            // Add Gallery widgets here if necessary
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(page: 2,),
    );
  }

  Widget _buildCategoryButton(String title, String age) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        Text(age, style: TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {},
          child: Text('See All'),
        ),
      ],
    );
  }

  Widget _buildInformationTile(String title, String date, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Image.asset(
          imagePath, // Display the image instead of an icon
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
        title: Text(title),
        subtitle: Text(date),
      ),
    );
  }
}
