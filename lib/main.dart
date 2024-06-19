import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout_planner_app/pages/add_page.dart';
import 'package:workout_planner_app/pages/favourites_page.dart';
import 'package:workout_planner_app/pages/home_page.dart';
import 'package:workout_planner_app/pages/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const AddPage(),
    const FavouritesPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Workout Planner',
      theme: ThemeData(
        primaryColor: Colors.white,
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favourites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
        body: _pages[_currentIndex],
      ),
    );
  }
}
