// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

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
          onPressed:  () {
           Home();
          }
        ),
        GButton(
          icon: Icons.search,
          text: 'Search',
           onPressed:  () {
             Search();
          }
        ),
        GButton(
          icon: Icons.shopping_cart,
          text: 'Cart',
           onPressed:  () {
            Cart();
          }
        ),
        GButton(
          icon: Icons.person,
          text: 'Profile',
           onPressed:  () {
            Profil();
          }
        ),
      ],
    ));
  }
}
