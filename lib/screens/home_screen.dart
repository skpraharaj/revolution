import 'package:flutter/material.dart';
import 'package:revolution/widgets/category_selector.dart';
import 'package:revolution/widgets/favourite_contacts.dart';
import 'package:revolution/widgets/recent_chats.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getCurrentuser();
  }

  void getCurrentuser() {
    FirebaseAuth.instance.authStateChanges().listen((User? firebaseUser) {
      if (firebaseUser == null) {
        print('User is currently signed out! as ');
      } else {
        print('User is signed in!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {},
        ),
        title: Center(
          child: Text('Chats'),
        ),
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, 'search_screen');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          CategorySelector(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: [
                  FavouriteContacts(),
                  RecentChats(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
