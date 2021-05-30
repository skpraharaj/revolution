import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:revolution/services/database_service.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchText = "";
  DatabaseService databaseService = DatabaseService();
  TextEditingController searchTextEditingController =
      new TextEditingController();
  QuerySnapshot? searchResultSnapshot;

  bool isLoading = false;
  bool haveUserSearched = false;

  // initiateSearch() async {
  //   if (searchTextEditingController.text.isNotEmpty) {
  //     setState(() {
  //       isLoading = true;
  //     });
  //     await databaseService
  //         .getUserByUsername(searchTextEditingController.text)
  //         .then((snapshot) {
  //       searchResultSnapshot = snapshot;
  //       print("$searchResultSnapshot");
  //       setState(() {
  //         isLoading = false;
  //         haveUserSearched = true;
  //       });
  //     });
  //   }
  // }

  Widget userList(String searchText) {
    return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
        future: databaseService.getUserByUsername(searchText),
        builder: (context, snapshot) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                return userTile(
                    snapshot.data?.docs[index].data()["userName"] ?? "userName",
                    snapshot.data?.docs[index].data()["email"] ?? "email");
              });
        });
  }

  Widget userTile(String userName, String userEmail) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                userEmail,
                style: TextStyle(color: Colors.white, fontSize: 16),
              )
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              // s endMessage(userName);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(24)),
              child: Text(
                "Message",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SearchScreen'),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(color: Colors.grey[200] ?? Colors.grey),
                      ),
                    ),
                    child: TextField(
                      controller: searchTextEditingController,
                      decoration: InputDecoration(
                          hintText: "Search here",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      searchText = searchTextEditingController.text;
                    });
                  },
                )
              ],
            ),
            searchText != "" ? userList(searchText) : Container(),
          ],
        ),
      ),
    );
  }
}
