import 'package:flutter/material.dart';
import 'package:flutter_application_3/views/tools_views.dart';
import 'package:flutter_application_3/widgets/bottom_nav.dart'; // Pastikan import path sesuai

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 12, 104, 178),
        centerTitle: true,
        title: Text("Hi, Beauty",
            style: TextStyle(color: Colors.white, fontSize: 15)),
        leading: Stack(
          children: [
            Icon(Icons.menu),
            Positioned(
              left: 8,
              child: Image.asset("dblplay.png", width: 50, height: 50),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notification_add_sharp, color: Colors.white),
            onPressed: () => print('Notification icon pressed'),
          ),
          IconButton(
            onPressed: () => print("More icon pressed"),
            icon: Icon(Icons.more_vert, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Bagian Pencarian dan Tombol Fitur
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Search Player, School, News & Others",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildTopButton("DBL Coins", Icons.monetization_on),
                      _buildTopButton("Top Up", Icons.add),
                      _buildTopButton("History", Icons.history),
                      _buildTopButton("Explore", Icons.explore),
                    ],
                  ),
                ],
              ),
            ),

            // Grid Item
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              margin: EdgeInsets.all(15),
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 15.0,
                childAspectRatio: 1.5,
                children: [
                  _buildGridItem(context, "News", Icons.article, page: NewsPage()),
                  _buildGridItem(context, "Video", Icons.play_circle_fill, page: VideoPage()),
                  _buildGridItem(context, "Livestream", Icons.live_tv, isNew: true, page: LivestreamPage()),
                  _buildGridItem(context, "Match", Icons.sports_basketball, page: MatchPage()),
                  _buildGridItem(context, "Event Reg", Icons.event, page: EventPage()),
                  _buildGridItem(context, "Votes", Icons.how_to_vote, isNew: true, page: VotesPage()),
                  _buildGridItem(context, "Gallery", Icons.photo_album, page: GalleryPage()),
                  _buildGridItem(context, "Ticket", Icons.confirmation_number, page: TicketPage()),
                ],
              ),
            ),

            // Bagian Livestream
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Livestream",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  _buildLivestreamItem("SMP KANISIUS vs SMP AL-MARUF", "BOYS", "03 Nov 2024 | 10:30 WIB", "smpkanisius_smpalmaruf.jpg"),
                  SizedBox(height: 10),
                  _buildLivestreamItem("SMP NEGERI 68 JAKARTA vs SMP JUBILEE JAKARTA", "BOYS", "03 Nov 2024 | 11:40 WIB", "smpn68jkt_smpjubilee.jpg"),
                  SizedBox(height: 10),
                  _buildLivestreamItem("SMA THEODORUS KOTAMOBAGU vs SMA AQUINO AMURANG", "BOYS", "03 Nov 2024 | 12:00 WIB", "smatheodorus.jpg"),
                ],
              ),
            ),

            // Bagian Latest News
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Latest News",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ]  
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(page: 0), // Tambahkan BottomNav dengan index 0 untuk halaman Home
    );
  }

  Widget _buildTopButton(String title, IconData icon) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.blue.shade100,
          child: Icon(icon, color: Colors.blue),
        ),
        SizedBox(height: 5),
        Text(title, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildGridItem(BuildContext context, String title, IconData icon,
      {bool isNew = false, required Widget page}) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 244, 244, 244),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 24, color: Colors.blue),
                SizedBox(height: 5),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
          if (isNew)
            Positioned(
              top: 5,
              right: 5,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "NEW",
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildLivestreamItem(String match, String category, String time, String imagePath) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 244, 244, 244),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 60,
            height: 60,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  match,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  category,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                Text(
                  time,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              "NOW STREAMING!",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
            

  }
}