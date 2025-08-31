import 'package:flutter/material.dart';
import '../colors.dart';
import 'start.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int myIndex = 0;

  
  // pages
  final List<Widget> _pages = [
    StartPage(),
    Center(child: Text("Complaint Page")),
    Center(child: Text("History Page")),
    Center(child: Text("Profile Page")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),   // 👈 only top corners
          topRight: Radius.circular(16),
        ),
        child: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.lightOlive,
          selectedItemColor: AppColors.secondary,
          unselectedItemColor: AppColors.accent,
          items: const [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.symmetric(vertical: 6), // 👈 vertical spacing
                child: Icon(Icons.home),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Icon(Icons.report),
              ),
              label: "Complaint",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Icon(Icons.history),
              ),
              label: "History",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Icon(Icons.person),
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
      body: _pages[myIndex],
    );
  }
}

