import 'package:circles/screens/create_circle.dart';
import 'package:circles/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:circles/models/circles.dart';
import 'package:circles/models/firestore_service.dart';
import 'home_screen.dart';

class CirclesPage extends StatefulWidget {
  @override
  final String userId;

  CirclesPage({Key key, @required this.userId}) : super(key: key);
  CollectionReference circles =
      FirebaseFirestore.instance.collection('circles');

  _CirclesPageState createState() => _CirclesPageState(userId);
}

class _CirclesPageState extends State<CirclesPage> {
  @override
  final String userId;
  _CirclesPageState(this.userId);
  QuerySnapshot _circlesFuture;
  List<Circles> circleslist = [];

  List<String> uids = [];

  final textControl = TextEditingController();

  Circles newCircle = new Circles();
  String curFriendName;

  void initState() {
    super.initState();
    fetchCirclesList();
  }

  Future getAllCircles() async {
    List<Circles> circlesWithUid = [];

    try {
      _circlesFuture = await widget.circles.get();

      final circlesData =
          List.from(_circlesFuture.docs.map((doc) => doc.data())).toList();

//      print("circles data");
//      print(circlesData);

      for (int i = 0; i < circlesData.length; ++i) {
// then you keep going while the index of " is still less than the index of "]"
        for (int j = 0; j < circlesData[i]["userIDs"].length; ++j) {
          //        print('compare value');
//          print(circlesData[i]["userIDs"][j]);
          //      print('compared to user id');
          //    print(userId);

          if (circlesData[i]["userIDs"][j] == userId) {
//            print('found match');
            Circles newCircle = new Circles();

//            print('initialized new circle');

            if (circlesData[i]["name"] != null)
              newCircle.name = circlesData[i]["name"];

//            print('newcirclename');
            //          print(newCircle.name);

            if (circlesData[i]["description"] != null)
              newCircle.description = circlesData[i]["description"];

            if (circlesData[i]["userIDs"] != null)
              newCircle.userIds = circlesData[i]["userIDs"].cast<String>();

            if (circlesData[i]["id"] != null)
              newCircle.id = circlesData[i]["id"];

//            print('newCircle');
            //          print(newCircle);

            circlesWithUid.add(newCircle);
            continue;
          }
        }
      }
//      print('circlesWithUid');
      //    print(circlesWithUid);
      String type = circlesWithUid.runtimeType.toString(); // List<Something>
//      print('type');
      //    print(type);

      return circlesWithUid;
    } catch (e) {
      throw (e);
    }
  }

  fetchCirclesList() async {
    dynamic circlesWithUid = await getAllCircles();

    if (circlesWithUid != null) {
      if (mounted) {
        setState(() {
          circleslist = circlesWithUid;
        });
      }
    }
  }

  Widget build(BuildContext context) {
    fetchCirclesList();

    print('user Id from circles page state');
    print(userId);
//    print('circleslist');
    Future<QuerySnapshot> _friendsFuture;
    List<QueryDocumentSnapshot<Map<String, dynamic>>> userList;
    List<String> invitedList;

    FirestoreService service = new FirestoreService();

    Circles test = new Circles();
    test.name = "test";
    test.description = "description";
    circleslist.add(test);

    final title = 'Your Circles';

    return new MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: ListView.builder(
            itemCount: circleslist.length,
            itemBuilder: (context, index) {
              return Container(
                color: RedOrange.withOpacity(0.2),
                child: ListTile(
                    title: Text(circleslist[index].name),
                    subtitle: Text(circleslist[index].description)),
              );
            }),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CreateCircle(userId: userId)));
            },
            label: const Text('Add Circle'),
            backgroundColor: Theme.of(context).accentColor),
      ),
    );
/*   return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('Your Circles', style: TextStyle(color: WhiteGrey)),
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
                      ) */
  }
}
