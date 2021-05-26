import 'package:circles/models/auth_service.dart';
import 'package:circles/models/firestore_service.dart';
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

  @override
  Widget build(BuildContext context) {
    //print(widget.event);
    Color color = Theme.of(context).primaryColor;

    Widget ResponseSection = Container(
      padding: EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(
              Green, Icons.check_circle_outline, 'Going', pressedButton, 0),
          _buildButtonColumn(Yellow, Icons.not_listed_location_outlined,
              'Interested', pressedButton, 1),
          _buildButtonColumn(
              RedOrange, Icons.cancel_outlined, 'Not Going', pressedButton, 2),
        ],
      ),
    );

    Widget TitleSection = Container(
      padding: const EdgeInsets.all(32),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //rExpanded(child:
          SizedBox(
            width: 150.0,
            child: TextButton(
              onPressed: () => null,
              child: Text('Friends going', style: TextStyle(fontSize: 18.0)),
              style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                  foregroundColor: MaterialStateProperty.all<Color>(color),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: color)))),
            ),
          ),
          //),
          //Expanded(child:
          SizedBox(
            width: 150.0,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => InviteFriends(
                        userId: widget.userId, event: widget.event)));
              },
              child: Text('+ Invite', style: TextStyle(fontSize: 18.0)),
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
          //),
        ],
      ),
      padding: const EdgeInsets.only(bottom: 20),
    );

    Widget AccountSection = Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        _buildButton(color, Icons.account_circle),
        _buildButton(color, Icons.account_circle),
        _buildButton(color, Icons.account_circle),
        _buildButton(color, Icons.account_circle),
        _buildButton(color, Icons.account_circle),
      ],
    ));

    Widget DescriptionSection = Container(
      padding: const EdgeInsets.all(32),
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
              ResponseSection,
              TitleSection,
              ButtonSection,
              AccountSection,
              Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Text("Alex and 10 others going",
                      style: TextStyle(fontSize: 20.0))),
              DescriptionSection,
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
