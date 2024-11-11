import 'package:flutter/material.dart';
import 'package:flutter_application_3/views/home_view.dart';
import 'package:flutter_application_3/widgets/bottom_nav.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfilePage(); // Remove the MaterialApp wrapping
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the home page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeView()), // Replace with your HomePage widget
            );
          },
        ),
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 12, 104, 178),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.blue,
                  child: Image.asset(
                    'lapa.jpg', // Use the correct path
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(color: Colors.blue); // Error handling
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: const Color.fromARGB(255, 201, 201, 201),
                      child: Icon(Icons.person, size: 50, color: Colors.white),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 10),
                        Text(
                          'Beauty',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Female',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.photo, color: Colors.blue),
                              SizedBox(height: 8),
                              Text(
                                'My Photos',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.monetization_on, color: Colors.orange),
                              SizedBox(height: 8),
                              Text(
                                '0 Coins',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // New Row for "Edit Profile", "Email", and "Log Out"
                  Column(
                    children: [
                      ProfileOption(
                        icon: Icons.account_circle,
                        text: 'Edit Profile',
                        iconColor: Colors.blue,
                        onTap: () {
                          // Edit profile functionality here
                        },
                      ),
                      SizedBox(height: 10),
                      ProfileOption(
                        icon: Icons.email,
                        text: 'abeautycdfgh@gmail.com',
                        iconColor: Colors.purple,
                        onTap: () {},
                        trailingIcon: Icons.check_circle,
                        trailingIconColor: Colors.green,
                      ),
                      SizedBox(height: 10),
                      ProfileOption(
                        icon: Icons.logout,
                        text: 'Log Out',
                        iconColor: Colors.red,
                        onTap: () {
                          // Log out functionality here
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(page: 3),
    );
  }
}

// Reusable widget for profile options
class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final VoidCallback onTap;
  final IconData? trailingIcon;
  final Color? trailingIconColor;

  ProfileOption({
    required this.icon,
    required this.text,
    required this.iconColor,
    required this.onTap,
    this.trailingIcon,
    this.trailingIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: iconColor),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: TextStyle(fontSize: 16),
              ),
            ),
            if (trailingIcon != null)
              Icon(trailingIcon, color: trailingIconColor),
          ],
        ),
      ),
    );
  }
}
