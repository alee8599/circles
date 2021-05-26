import 'package:circles/models/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:circles/theme.dart';
import 'package:circles/models/event.dart';

class InviteFriends extends StatefulWidget {
  String userId;
  Event event;

  InviteFriends({this.userId, this.event});

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference events = FirebaseFirestore.instance.collection('events');

  @override
  _InviteFriendsState createState() => _InviteFriendsState();
}

class _InviteFriendsState extends State<InviteFriends> {
  Future<QuerySnapshot> _friendsFuture;
  List<QueryDocumentSnapshot<Map<String, dynamic>>> userList;
  List<String> invitedList;

  List<int> selectedItems = [];

  void initState() {
    super.initState();
    widget.events.doc(widget.event.id).get().then((DocumentSnapshot snapshot) {
      invitedList = snapshot.get('invited');
    });
    _friendsFuture = widget.users.get();
  }

/*return FutureBuilder<QuerySnapshot>(
  future: _eventsFuture,
  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
  if (snapshot.connectionState == ConnectionState.done) {
  List<QueryDocumentSnapshot<Map<String, dynamic>>> eventlist =
  snapshot.data.docs;*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('Invite Friends', style: TextStyle(color: WhiteGrey)),
        ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .785,
              child: FutureBuilder<QuerySnapshot>(
                  future: _friendsFuture,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      userList = snapshot.data.docs;
                      return new ListView.builder(
                        itemCount: userList.length,
                        itemBuilder: (context, index) {
                          FirestoreService service;

                          return Container(
                            color: ((selectedItems != null &&
                                    selectedItems.contains(
                                        index)) /*||
                                    invitedList.contains(
                                        service.getUserIdFromName(
                                            userList[index].get('name')))*/
                                )
                                ? RedOrange.withOpacity(0.5)
                                : Colors.transparent,
                            child: ListTile(
                              title: Text(userList[index].get('name')),
                              onTap: () {
                                if (selectedItems != null &&
                                    selectedItems.contains(index)) {
                                  setState(() {
                                    selectedItems.remove(index);
                                    print(selectedItems);
                                  });
                                } else {
                                  setState(() {
                                    selectedItems.add(index);
                                    print(selectedItems);
                                  });
                                }
                              },
                            ),
                          );
                        },
                      );
                    }

                    return CircularProgressIndicator();
                  }),
            ),
            Container(
                width: 300.0,
                height: 50.0,
                child: ElevatedButton(
                    onPressed: () {
                      if (selectedItems.isNotEmpty) {
                        selectedItems.forEach((index) {
                          FirestoreService.addUsertoList(
                              userList[index].get('id'),
                              widget.event,
                              'invited');
                        });
                      }
                      Navigator.of(context).pop();
                    },
                    child: Text('Invite')))
          ],
        ));
  }
}

/*
class InviteFriends extends StatefulWidget {
  String userId;

  InviteFriends({this.userId});

  FirebaseFirestore firestore = FirebaseFirestore.instance;

}
  @override
  _InviteFriendsState createState() => _InviteFriendsState();
}

class _InviteFriendsState extends State<InviteFriends> {
*/

/*void initState(){
    super.initState();
    //Future<QuerySnapshot> _friendsFuture =
  }*/ /*




  */
/*return FutureBuilder<QuerySnapshot>(
  future: _eventsFuture,
  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
  if (snapshot.connectionState == ConnectionState.done) {
  List<QueryDocumentSnapshot<Map<String, dynamic>>> eventlist =
  snapshot.data.docs;*/ /*


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Invite Friends'),
      ),
      body: Container()
    );
  }
}
*/
