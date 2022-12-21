// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: GNav(
          color:Colors.grey,
          activeColor:Colors.indigo,
          gap: 8,
      tabs: [
        GButton(
          icon: Icons.home,
          text: 'Home',
        ),
        GButton(
          icon: Icons.search,
          text: 'Search',
        ),
        GButton(
          icon: Icons.shopping_cart,
          text: 'Cart',
        ),
        GButton(
          icon: Icons.person,
          text: 'Profile',
        ),
      ],
    ));
  }
}
