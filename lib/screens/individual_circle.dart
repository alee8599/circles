import 'package:circles/models/user_model.dart';
import 'package:flutter/material.dart';
import 'circles_page.dart';
import 'package:circles/models/circles.dart';
import 'package:circles/models/firestore_service.dart';
import 'package:circles/models/user_model.dart';

class IndividualCircle extends StatefulWidget {
  Circles circle;

  IndividualCircle({this.circle});

  @override
  _IndividualCircleState createState() => _IndividualCircleState();
}

class _IndividualCircleState extends State<IndividualCircle> {
  FirestoreService firestore = FirestoreService();

  List<String> userNames = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }

  void getUsers() async {
    print(widget.circle.userIds);

    for (int i = 0; i < widget.circle.userIds.length; i++) {
      CirclesUser user = await firestore.getUser(widget.circle.userIds[i]);
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
          title: Text(widget.circle.name),
        ),
        body: userNames.isNotEmpty
            ? ListView.builder(
                itemCount: userNames.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(userNames[index]));
                })
            : Text(
                'No friends in Circle',
              ));
  }
}
