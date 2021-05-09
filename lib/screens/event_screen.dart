import 'package:circles/theme.dart';
import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPage createState() => _EventPage();
}

class _EventPage extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget ResponseSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.check_circle_outline, 'Going'),
          _buildButtonColumn(color, Icons.not_listed_location_outlined, 'Interested'),
          _buildButtonColumn(color, Icons.cancel_outlined, 'Not Going'),
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
                    ),
                  ),
                ),
                Text(
                  'Hosted by: John T',
                  style: TextStyle(
                    color: Colors.grey[500],
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
          TextButton(
            onPressed: () => null,
            child: Text(
              'Friends going'),
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
              foregroundColor: MaterialStateProperty.all<Color>(color),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: color)
                )
              )
            ),
          ),
          TextButton(
            onPressed: () => null,
            child: Text(
              '+ Invite'),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(WhiteGrey),
              backgroundColor: MaterialStateProperty.all<Color>(color),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: color)
                )
              )
            ),
          )
        ],
      ),
    );

    Widget AccountSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButton(color, Icons.account_circle),
          _buildButton(color, Icons.account_circle),
          _buildButton(color, Icons.account_circle),
          _buildButton(color, Icons.account_circle),
          _buildButton(color, Icons.account_circle),
          _buildButton(color, Icons.account_circle),
          _buildButton(color, Icons.account_circle),
        ],
      )
    );

    Widget DescriptionSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Come hangout and have fun during this week!'
        'Event will be chill and feel free to invite friends!',
        softWrap: true,
      ),
    );

    return MaterialApp(
      //title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fountain Hopping'),
        ),
        body: Column(
          children: [
            Image.asset('lib/assets/images/fountain.jpg',
                fit: BoxFit.cover, width: double.infinity),
            ResponseSection,
            TitleSection,
            ButtonSection,
            AccountSection,
            DescriptionSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
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
        Icon(icon, color: color),
      ],
    );
  }
}
