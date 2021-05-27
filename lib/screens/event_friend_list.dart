import 'package:circles/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:circles/models/event.dart';
import 'package:circles/models/firestore_service.dart';
import 'package:circles/models/user_model.dart';

class EventFriendList extends StatefulWidget {
  Event event;
  String type;

  EventFriendList({this.event, this.type});

  @override
  _EventFriendListState createState() => _EventFriendListState();
}

class _EventFriendListState extends State<EventFriendList> {
  FirestoreService firestore = FirestoreService();

  List<String> userNames = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }

  void getUsers() async {
    List<String> list = [];
    switch (widget.type) {
      case "invited":
        {
          list = widget.event.invited;
        }
        break;

      case "going":
        {
          list = widget.event.going;
        }
        break;

      case "rejected":
        {
          list = widget.event.rejected;
        }
    }

    for (int i = 0; i < list.length; i++) {
      CirclesUser user = await firestore.getUser(list[i]);
      setState(() {
        userNames.add(user.name);
      });
      print(userNames);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(widget.type),
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: userNames.isNotEmpty
            ? ListView.builder(
                itemCount: userNames.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(userNames[index]));
                })
            : Text(
                'Nobody in the list',
              ));
  }
}
