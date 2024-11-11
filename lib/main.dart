import 'package:flutter/material.dart';
import 'package:flutter_application_3/views/academy_view.dart';
import 'package:flutter_application_3/views/home_view.dart';
import 'package:flutter_application_3/views/profile_view.dart';
import 'package:flutter_application_3/views/store_view.dart';

void main() {  
runApp(const MyApp()); 
} 

class MyApp extends StatelessWidget {  
  const MyApp({super.key}); 

// This widget is the root of your application.  
@override
Widget build(BuildContext context) {  
  return MaterialApp( 
    title: "DBL PLAY", 
    initialRoute: '/',
    routes: <String, Widget Function(BuildContext)>{
      '/':(BuildContext context) =>HomeView(),
      '/store':(BuildContext context) =>StoreView(),
      '/academy':(BuildContext context) =>AcademyView(),
      '/profile':(BuildContext context) =>ProfileView(),
    }
    );
  } 
}