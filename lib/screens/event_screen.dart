import 'package:circles/theme.dart';
import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPage createState() => _EventPage();
}

class _EventPage extends State<EventPage> {
  int pressedButton = 0;

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget ResponseSection = Container(
      padding: EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(
              Green, Icons.check_circle_outline, 'Going', pressedButton, 0),
          _buildButtonColumn(
            Yellow, Icons.not_listed_location_outlined, 'Interested', pressedButton, 1),
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
                    'Fountain Hopping',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26.0,
                    ),
                  ),
                ),
                Text(
                  'Hosted by: John T.',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 18.0,
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
              onPressed: () => null,
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
        'Come hangout and have fun during this week!'
        'Event will be chill and feel free to invite friends!',
        softWrap: true,
        style: 
          TextStyle(
            fontSize: 16.0,
          ),
      ),
    );

    return MaterialApp(
      //title: 'Welcome to Flutter',s
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fountain Hopping', style: TextStyle(fontSize:24.0)),
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
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(icon, size: 40.0),
          color: pressed ? color : Grey,
          onPressed: () => {
            setState(() {
              pressedButton = index;
            })
          },
        ),
        Container(
          margin: EdgeInsets.only(top: 8, left: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
              color: pressed ? color : Grey,
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
        Icon(icon, color: color, size:60),
      ],
    );
  }
}
