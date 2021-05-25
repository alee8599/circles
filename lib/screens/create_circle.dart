import 'package:circles/theme.dart';
import 'package:flutter/material.dart';
import 'package:circles/models/circles.dart';
import 'package:circles/models/firestore_service.dart';
import 'home_screen.dart';

class CreateCircle extends StatefulWidget {
  @override
  final String userId;

  CreateCircle({Key key, @required this.userId}) : super(key: key);

  _CreateCircleState createState() => _CreateCircleState(userId);
}

class _CreateCircleState extends State<CreateCircle> {
  @override
  final String userId;
  _CreateCircleState(this.userId);

  List<String> uids = [];

  final textControl = TextEditingController();

  Circles newCircle = new Circles();

  String curFriendName;
  void initState() {
    super.initState();
    print('user Id from create circles state');
    print(userId);
  }

  Widget build(BuildContext context) {
    print('user Id from create circles state');
    print(userId);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text(
        "Create Your Circle",
        textAlign: TextAlign.left,
        style: TextStyle(
            color: Colors.white, fontSize: 30.0, fontFamily: "Kayak Sans"),
      )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 16.0),
                child: Text(
                  "Create a group chat with your friends!",
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                )),
            Image.asset(
              "lib/assets/images/circles_logo.jpg",
              height: 200.0,
              width: 200.0,
            ),
            Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: Text("Name of Circles Group",
                    style: TextStyle(fontSize: 20.0))),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 20.0),
              child: TextField(
                  decoration:
                      InputDecoration(fillColor: WhiteGrey, filled: true),
                  onChanged: (value) {
                    if (mounted) {
                      setState(() {
                        newCircle.name = value.trim();
                      });
                    }
                  }),
            ),
            Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text("Description", style: TextStyle(fontSize: 20.0))),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 20.0),
              child: TextField(
                  decoration:
                      InputDecoration(fillColor: WhiteGrey, filled: true),
                  onChanged: (value) {
                    if (mounted) {
                      setState(() {
                        newCircle.description = value.trim();
                      });
                    }
                  }),
            ),
            Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text("Friend Name", style: TextStyle(fontSize: 20.0))),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 20.0),
              child: TextField(
                  decoration:
                      InputDecoration(fillColor: WhiteGrey, filled: true),
                  controller: textControl,
                  onChanged: (value) {
                    if (mounted) {
                      setState(() {
                        curFriendName = value.trim();
                      });
                    }
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: Text(
                    '+ Add Friends to Circle',
                    style: TextStyle(fontSize: 30.0),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: RedOrange,
                  ),
                  onPressed: () async {
                    FirestoreService _firestoreService = new FirestoreService();
                    String id = await _firestoreService
                        .getUserIdFromName(curFriendName);

                    if (newCircle.userIds == null) newCircle.userIds = [];

                    newCircle.userIds.add(id);
                    textControl.clear();
                  },
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 20.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: Text(
                    'Create Circle',
                    style: TextStyle(fontSize: 30.0),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: RedOrange,
                  ),
                  onPressed: () async {
                    // Push the circle we've created to Firebase
                    newCircle.userIds.add(userId);

                    FirestoreService _firestoreService = new FirestoreService();

                    try {
                      await _firestoreService.createCircles(newCircle);
                    } catch (e) {
                      print(e);
                    }

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
