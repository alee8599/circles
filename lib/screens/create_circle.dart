import 'package:circles/theme.dart';
import 'package:flutter/material.dart';

class CreateCircle extends StatefulWidget {
  @override
  _CreateCircleState createState() => _CreateCircleState();
}

class _CreateCircleState extends State<CreateCircle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFAFAFA),
        appBar: AppBar(
          title: Text(
          "Create Your Circle",
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.white, fontSize: 30.0, fontFamily: "Kayak Sans"),
        )),
        body: Column(
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
            Image.asset("lib/assets/images/circles_logo.jpg"),
            
            Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: Text("Name of Circles Group", style: TextStyle(fontSize: 20.0))),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 20.0),
              child: TextField(
                decoration: InputDecoration( fillColor: WhiteGrey, filled: true)
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text("Description", style: TextStyle(fontSize: 20.0))),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 40.0),
              child: TextField(
                decoration: InputDecoration( fillColor: WhiteGrey, filled: true, hintText: "(Optional)")
              ),
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
                  onPressed: () {
                    print('Pressed');
                  },
                ),
                // ElevatedButton(
                //     child: Text('Sign up'),
                //     style: ElevatedButton.styleFrom(
                //         primary: Theme.of(context).accentColor),
                //     //onPressed: () => _signup(_email, _password))
                // )
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
                  onPressed: () {
                    print('Pressed');
                  },
                ),
                // ElevatedButton(
                //     child: Text('Sign up'),
                //     style: ElevatedButton.styleFrom(
                //         primary: Theme.of(context).accentColor),
                //     //onPressed: () => _signup(_email, _password))
                // )
              ],
            )
          ],
        ));
  }
}