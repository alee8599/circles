import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:circles/models/message_model.dart';
import 'package:circles/screens/chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecentChats extends StatelessWidget {
  final Stream<QuerySnapshot> _chatStream = FirebaseFirestore.instance.collection('chats').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _chatStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        return Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  final Chat chat = Chat(
                      event_name: snapshot.data.docs[index].get('event_name'),
                      users: snapshot.data.docs[index].get('users'),
                      msgs: snapshot.data.docs[index].get('msgs')
                  );
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatScreen(
                          user: currentUser,
                          index: index
                        ),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 20.0),
                      padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 35.0,
                                backgroundImage: AssetImage('lib/assets/images/penguin.jpg'),
                              ),
                              SizedBox(width: 10.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    chat.event_name,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.45,
                                    child: Text(
                                      chat.msgs[0],
                                      style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              // Text(
                              //   chat.time,
                              //   style: TextStyle(
                              //     color: Colors.grey,
                              //     fontSize: 15.0,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                              SizedBox(height: 5.0),

                              Text(''),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      }
    );
  }
}