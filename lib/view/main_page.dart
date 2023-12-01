import 'package:flutter/material.dart';
import 'package:hair_salon/view/categories.dart';
import 'package:hair_salon/view/home.dart';

final screen = [
  const HomePage(),
  const CategoriesPage(),
  const HomePage(),
  const CategoriesPage(),
  const HomePage(),
];

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 10, 53, 87),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Icon(Icons.home),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Icon(Icons.category_outlined),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Icon(Icons.calendar_month_outlined),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Icon(Icons.message_outlined),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Icon(Icons.person_outline),
            ),
            label: '',
          ),
        ],
        // type: BottomNavigationBarType.shifting,
        onTap: onItemTapped,
      ),
      body: screen[selectedIndex],
    );
  }
}
