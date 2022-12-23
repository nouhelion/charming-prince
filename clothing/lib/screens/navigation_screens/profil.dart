// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, use_build_context_synchronously

import 'package:clothing/main.dart';
import 'package:clothing/screens/navigation_screens/cart.dart';
import 'package:clothing/screens/navigation_screens/search.dart';
import 'package:clothing/screens/welcome_screen/welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  int pageIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      pageIndex = index;

      if (index == 0) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Welcome()));
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

  String id = '';
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  Future<void> getCurrentUser() async {
    // Get a reference to the current user
    User user = _auth.currentUser!;

    // Get the user's unique identifier
    String uid = user.uid;

    // Get a reference to the 'users' collection
    CollectionReference usersCollection = _firestore.collection('Users');

    // Get a reference to the document with the user's data
    DocumentReference userDocument = usersCollection.doc(uid);

    // Get the data from the document
    userDocument.get().then((snapshot) async {
      Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>;
      // Set the data as the initial value of the TextEditingController
      _nameController.text = data['name'];
      _emailController.text = data['email'];
      _phoneController.text = data['phone'];
    });
  }

  Future<void> signOut() async {
    // Sign out the user
    await _auth.signOut();
    // Route to the login page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    // Other widgets in the app
                    Positioned(
                      top: 16,
                      right: 16,
                      child: InkWell(
                        onTap: () => signOut(),
                        child: Icon(
                          Icons.exit_to_app,
                          size: 32,
                          color: Colors.indigoAccent,
                        ),
                      ),
                    ),
                    Text(
                      "Your Profile",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Modify your profile information",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    TextField(
                      keyboardType: TextInputType.text,
                      controller: _nameController,
                      decoration: InputDecoration(
                          labelText: 'Full Name',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.indigo),
                          )),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      keyboardType: TextInputType.text,
                      controller: _emailController,
                      decoration: InputDecoration(
                          labelText: 'E-mail',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.indigo),
                          )),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      keyboardType: TextInputType.phone,
                      controller: _phoneController,
                      decoration: InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.indigo),
                          )),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 3, left: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border(
                        bottom: BorderSide(color: Colors.black),
                        top: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),
                      )),
                  child: MaterialButton(
                    minWidth: 120,
                    height: 60,
                    onPressed: () {},
                    color: Colors.indigo,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      "Modify",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: GNav(
        selectedIndex: pageIndex,
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
