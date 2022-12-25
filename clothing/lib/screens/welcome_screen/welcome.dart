// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, non_constant_identifier_names

import 'package:clothing/screens/navigation_screens/cart.dart';

import 'package:clothing/screens/navigation_screens/profil.dart';
import 'package:clothing/screens/navigation_screens/search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// Initialize a Firestore instance
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final Stream<QuerySnapshot> _categoriesStream =
    FirebaseFirestore.instance.collection('Categories').snapshots();
final Stream<QuerySnapshot> _dressesStream =
    FirebaseFirestore.instance.collection('Dresses').snapshots();
final Stream<QuerySnapshot> _accessoriesStream =
    FirebaseFirestore.instance.collection('Accessories').snapshots();
final Stream<QuerySnapshot> _topsblousesStream =
    FirebaseFirestore.instance.collection('Tops&Blouses').snapshots();
final Stream<QuerySnapshot> _pantsStream =
    FirebaseFirestore.instance.collection('Pants').snapshots();
final Stream<QuerySnapshot> _sweatersStream =
    FirebaseFirestore.instance.collection('Sweaters').snapshots();
final Stream<QuerySnapshot> _jacketsStream =
    FirebaseFirestore.instance.collection('Jackets').snapshots();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Container(
          child: StreamBuilder<QuerySnapshot>(
            stream: _categoriesStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return Card(
                    clipBehavior: Clip.hardEdge,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: InkWell(
                        child: ListTile(
                          //leading: Image.network(data['urlpic']),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.indigoAccent,
                            size: 15,
                          ),
                          leading: FaIcon(FontAwesomeIcons.shirt),
                          title: Text(data['name']),
                        ),
                        onTap: () {
                          if (data['name'] == 'Dresses') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DressesPage(data: data)));
                          }
                          if (data['name'] == 'Accessories') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AccessoriesPage(data: data)));
                          }
                          if (data['name'] == 'Tops & Blouses') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TopsBlousesPage(data: data)));
                          }
                          if (data['name'] == 'Pants') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PantsPage(data: data)));
                          }
                          if (data['name'] == 'Sweaters') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SweatersPage(data: data)));
                          }
                          if (data['name'] == 'Jackets') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        JacketsPage(data: data)));
                          }
                        }),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
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

class DressesPage extends StatefulWidget {
  final Map<String, dynamic> data;

  const DressesPage({Key? key, required this.data}) : super(key: key);

  @override
  State<DressesPage> createState() => _DressesPageState();
}

class _DressesPageState extends State<DressesPage> {
  int pageIndex = 2;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[300],
        title: Text(widget.data['name']),
      ),
      body: Container(
        child: Row(
          children: [
            Expanded(
                child: Container(
              child: StreamBuilder<QuerySnapshot>(
                stream: _dressesStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView(
                    shrinkWrap: true,
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> dress =
                          document.data()! as Map<String, dynamic>;
                      return Card(
                        clipBehavior: Clip.hardEdge,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: InkWell(
                            child: ListTile(
                              leading: Image.network(dress['urlpic']),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.indigoAccent,
                                size: 15,
                              ),
                              title: Text(dress['name']),
                              subtitle: Text(dress['price']),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DetailsProduct(data: dress)));
                            }),
                      );
                    }).toList(),
                  );
                },
              ),
            ))
          ],
        ),
      ),
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

class AccessoriesPage extends StatefulWidget {
  final Map<String, dynamic> data;

  const AccessoriesPage({Key? key, required this.data}) : super(key: key);

  @override
  State<AccessoriesPage> createState() => _AccessoriesPageState();
}

class _AccessoriesPageState extends State<AccessoriesPage> {
  int pageIndex = 2;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[300],
        title: Text(widget.data['name']),
      ),
      body: Container(
        child: Row(
          children: [
            Expanded(
                child: Container(
              child: StreamBuilder<QuerySnapshot>(
                stream: _accessoriesStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView(
                    shrinkWrap: true,
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> acc =
                          document.data()! as Map<String, dynamic>;
                      return Card(
                        clipBehavior: Clip.hardEdge,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: InkWell(
                            child: ListTile(
                              leading: Image.network(acc['urlpic']),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.indigoAccent,
                                size: 15,
                              ),
                              title: Text(acc['name']),
                              subtitle: Text(acc['price']),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DetailsProduct(data: acc)));
                            }),
                      );
                    }).toList(),
                  );
                },
              ),
            ))
          ],
        ),
      ),
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

class TopsBlousesPage extends StatefulWidget {
  final Map<String, dynamic> data;

  const TopsBlousesPage({Key? key, required this.data}) : super(key: key);

  @override
  State<TopsBlousesPage> createState() => _TopsBlousesPageState();
}

class _TopsBlousesPageState extends State<TopsBlousesPage> {
  int pageIndex = 2;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[300],
        title: Text(widget.data['name']),
      ),
      body: Container(
        child: Row(
          children: [
            Expanded(
                child: Container(
              child: StreamBuilder<QuerySnapshot>(
                stream: _topsblousesStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView(
                    shrinkWrap: true,
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> top =
                          document.data()! as Map<String, dynamic>;
                      return Card(
                        clipBehavior: Clip.hardEdge,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: InkWell(
                            child: ListTile(
                              leading: Image.network(top['urlpic']),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.indigoAccent,
                                size: 15,
                              ),
                              title: Text(top['name']),
                              subtitle: Text(top['price']),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DetailsProduct(data: top)));
                            }),
                      );
                    }).toList(),
                  );
                },
              ),
            ))
          ],
        ),
      ),
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

class PantsPage extends StatefulWidget {
  final Map<String, dynamic> data;

  const PantsPage({Key? key, required this.data}) : super(key: key);

  @override
  State<PantsPage> createState() => _PantsPageState();
}

class _PantsPageState extends State<PantsPage> {
  int pageIndex = 2;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[300],
        title: Text(widget.data['name']),
      ),
      body: Container(
        child: Row(
          children: [
            Expanded(
                child: Container(
              child: StreamBuilder<QuerySnapshot>(
                stream: _pantsStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView(
                    shrinkWrap: true,
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> pant =
                          document.data()! as Map<String, dynamic>;
                      return Card(
                        clipBehavior: Clip.hardEdge,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: InkWell(
                            child: ListTile(
                              leading: Image.network(pant['urlpic']),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.indigoAccent,
                                size: 15,
                              ),
                              title: Text(pant['name']),
                              subtitle: Text(pant['price']),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DetailsProduct(data: pant)));
                            }),
                      );
                    }).toList(),
                  );
                },
              ),
            ))
          ],
        ),
      ),
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

class SweatersPage extends StatefulWidget {
  final Map<String, dynamic> data;

  const SweatersPage({Key? key, required this.data}) : super(key: key);

  @override
  State<SweatersPage> createState() => _SweatersPageState();
}

class _SweatersPageState extends State<SweatersPage> {
  int pageIndex = 2;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[300],
        title: Text(widget.data['name']),
      ),
      body: Container(
        child: Row(
          children: [
            Expanded(
                child: Container(
              child: StreamBuilder<QuerySnapshot>(
                stream: _sweatersStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView(
                    shrinkWrap: true,
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> sweat =
                          document.data()! as Map<String, dynamic>;
                      return Card(
                        clipBehavior: Clip.hardEdge,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: InkWell(
                            child: ListTile(
                              leading: Image.network(sweat['urlpic']),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.indigoAccent,
                                size: 15,
                              ),
                              title: Text(sweat['name']),
                              subtitle: Text(sweat['price']),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DetailsProduct(data: sweat)));
                            }),
                      );
                    }).toList(),
                  );
                },
              ),
            ))
          ],
        ),
      ),
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

class JacketsPage extends StatefulWidget {
  final Map<String, dynamic> data;

  const JacketsPage({Key? key, required this.data}) : super(key: key);

  @override
  State<JacketsPage> createState() => _JacketsPageState();
}

class _JacketsPageState extends State<JacketsPage> {
  int pageIndex = 2;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[300],
        title: Text(widget.data['name']),
      ),
      body: Container(
        child: Row(
          children: [
            Expanded(
                child: Container(
              child: StreamBuilder<QuerySnapshot>(
                stream: _jacketsStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView(
                    shrinkWrap: true,
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> jack =
                          document.data()! as Map<String, dynamic>;
                      return Card(
                        clipBehavior: Clip.hardEdge,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: InkWell(
                            child: ListTile(
                              leading: Image.network(jack['urlpic']),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.indigoAccent,
                                size: 15,
                              ),
                              title: Text(jack['name']),
                              subtitle: Text(jack['price']),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DetailsProduct(data: jack)));
                            }),
                      );
                    }).toList(),
                  );
                },
              ),
            ))
          ],
        ),
      ),
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

class DetailsProduct extends StatefulWidget {
  final Map<String, dynamic> data;

  const DetailsProduct({Key? key, required this.data}) : super(key: key);

  @override
  State<DetailsProduct> createState() => _DetailsProductState();
}

class _DetailsProductState extends State<DetailsProduct> {
  int pageIndex = 2;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[300],
        title: Text(widget.data['name']),
      ),
      body: Center(
        child: Card(
          child: ListView(
            children: <Widget>[
              InkWell(
                child: Image(
                  width: 100,
                  height: 100,
                  image: NetworkImage(
                (widget.data['urlpic']),
              )),
              ),
              Center(
                child: Column(
                  children: [
                    Text(widget.data['name']),
                    Text(widget.data['price']),
                    Text(widget.data['brand']),
                    Text(widget.data['size']),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
