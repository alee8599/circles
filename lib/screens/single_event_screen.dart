import 'package:circles/models/auth_service.dart';
import 'package:circles/models/firestore_service.dart';
import 'package:circles/screens/event_friend_list.dart';
import 'package:circles/theme.dart';
import 'package:flutter/material.dart';
import 'package:circles/models/event.dart';
import 'package:circles/screens/coming_soon.dart';
import 'package:circles/screens/invite_friends.dart';

class EventPage extends StatefulWidget {
  AuthenticationService auth = AuthenticationService();

  Event event;
  String userId;

  EventPage({this.event, this.userId});

  @override
  _EventPage createState() => _EventPage();
}

class _EventPage extends State<EventPage> {
  int pressedButton = 0;
  List<String> invited = [];
  List<String> going = [];
  List<String> rejected = [];

  void getLists() {
    invited = widget.event.invited;
    going = widget.event.going;
    rejected = widget.event.rejected;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLists();
    if (going.contains(widget.userId)) {
      pressedButton = 1;
    } else if (rejected.contains(widget.userId)) {
      pressedButton = 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    //print(widget.event);
    Color color = Theme.of(context).primaryColor;

    Widget ResponseSection = Container(
      padding: EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(
              Green, Icons.check_circle_outline, 'Going', pressedButton, 1),
          _buildButtonColumn(
              RedOrange, Icons.cancel_outlined, 'Not Going', pressedButton, 2),
        ],
      ),
    );

    Widget TitleSection = Container(
      padding: const EdgeInsets.all(30),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    widget.event.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26.0,
                        fontFamily: "Kayak Sans"),
                  ),
                ),
                Text(
                  'Hosted by: ${widget.event.host}',
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 18.0,
                      fontFamily: "Kayak Sans"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Date and Time: ${widget.event.dateTime.toString()}',
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 18.0,
                        fontFamily: "Kayak Sans"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Widget ButtonSection = Container(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .5,
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    InviteFriends(userId: widget.userId, event: widget.event)));
          },
          child: Text('+ Invite Friends', style: TextStyle(fontSize: 18.0)),
          style: ButtonStyle(
              padding:
                  MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
              foregroundColor: MaterialStateProperty.all<Color>(WhiteGrey),
              backgroundColor: MaterialStateProperty.all<Color>(color),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: color)))),
        ),
      ),
      padding: const EdgeInsets.only(bottom: 20),
    );

    Widget DescriptionSection = Container(
      padding: const EdgeInsets.all(20),
      child: Text(
        'Description: '
        '${widget.event.description}',
        softWrap: true,
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
    );

    return MaterialApp(
      //title: 'Welcome to Flutter',s
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.event.name,
              style: TextStyle(fontSize: 24.0, fontFamily: "Kayak Sans")),
          backgroundColor: RedOrange,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: WhiteGrey,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('lib/assets/images/fountain.jpg',
                  fit: BoxFit.cover, width: double.infinity),
              TitleSection,
              DescriptionSection,
              ResponseSection,
              Container(
                padding: EdgeInsets.only(bottom: 20.0),

                /*ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(pressed ? Green : WhiteGrey),
              side: MaterialStateProperty.all<BorderSide>(pressed
                  ? BorderSide(width: 3.0, color: Green)
                  : BorderSide(width: 3.0, color: Grey)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)))),*/

                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 100.0,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(Green),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)))),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EventFriendList(
                                        type: "invited", event: widget.event)),
                              );
                            },
                            child: Text('Invited')),
                      ),
                      Container(
                        width: 100.0,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(Green),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)))),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EventFriendList(
                                        type: "going", event: widget.event)),
                              );
                            },
                            child: Text('Going')),
                      ),
                      Container(
                        width: 100.0,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(Green),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)))),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EventFriendList(
                                        type: "rejected", event: widget.event)),
                              );
                            },
                            child: Text('Not Going')),
                      ),
                    ]),
              ),
              ButtonSection,
            ],
          ),
        ),
      ),
    );
  }

  Column _buildButtonColumn(
      Color color, IconData icon, String label, int pressedNum, int index) {
    bool pressed = pressedNum == index;
    return Column(
      children: [
        Center(
          child: IconButton(
            icon: Icon(icon, size: 40.0),
            color: pressed ? color : Grey,
            onPressed: () {
              if (mounted) {
                if (label == "Going") {
                  if (rejected.contains(widget.userId)) {
                    FirestoreService.removeUser(
                        widget.userId, widget.event, "rejected");
                  }
                  FirestoreService.addUsertoList(
                      widget.userId, widget.event, "going");
                }
                if (label == "Not Going") {
                  if (going.contains(widget.userId)) {
                    FirestoreService.removeUser(
                        widget.userId, widget.event, "going");
                  }
                  FirestoreService.addUsertoList(
                      widget.userId, widget.event, "rejected");
                }
                setState(() {
                  pressedButton = index;
                });
              }
            },
          ),
        ),
        Center(
          child: Container(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
                color: pressed ? color : Grey,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column _buildButton(Color color, IconData icon) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color, size: 60),
      ],
    );
  }
}
