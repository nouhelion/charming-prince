// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element

import 'package:clothing/screens/navigation_screens/cart.dart';
import 'package:clothing/screens/navigation_screens/home.dart';
import 'package:clothing/screens/navigation_screens/profil.dart';
import 'package:clothing/screens/navigation_screens/search.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  int pageIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      pageIndex = index;

      if (index == 0) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      }
      if (index == 1) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Search()));
      }
      if (index == 2) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Cart()));
      }
      if (index == 3) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Profil()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        color: Colors.grey,
        activeColor: Colors.indigo,
        gap: 8,
        tabs: [
          GButton(
              icon: Icons.home,
              text: 'Home',
              onPressed: () {
                _onItemTapped(0);
              }),
          GButton(
              icon: Icons.search,
              text: 'Search',
              onPressed: () {
                _onItemTapped(1);
              }),
          GButton(
            icon: Icons.shopping_cart,
            text: 'Cart',
            onPressed: () {
              _onItemTapped(2);
            },
          ),
          GButton(
            icon: Icons.person,
            text: 'Profile',
            onPressed: () {
              _onItemTapped(3);
            },
          ),
        ],
      ),
    );
  }
}
