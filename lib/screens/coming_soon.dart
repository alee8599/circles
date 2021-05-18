import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.maybePop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 50.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset('lib/assets/images/circles_loginscreen.png',
                fit: BoxFit.contain, width: MediaQuery.of(context).size.width),
          ),
          Text(
            'Coming Soon!',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 50.0,
            ),
          )
        ],
      ),
    );
  }
}
