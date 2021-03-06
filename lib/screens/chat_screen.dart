import 'package:flutter/material.dart';
import 'package:circles/models/message_model.dart';
import 'package:circles/models/user_model.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {


  final CirclesUser user;
  final int index;
  ChatScreen({this.user, this.index});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String message = '';
  var now = DateTime.now();
  void sendMessage(int index, AsyncSnapshot<QuerySnapshot> snapshot) async {

    var messages = snapshot.data.docs[index].get('msgs');
    var id = snapshot.data.docs[index].id;
    messages.insert(0, message);
    await FirebaseFirestore.instance.collection('chats').doc(id).update({'msgs': messages});
    // setState(() {
    //   // FocusScope.of(context).unfocus();
    //   // final Message msg = Message(
    //   //   chat_id: 'Knitting Club',
    //   //   sender: currentUser,
    //   //   time: 'Today, ' + DateFormat('kk:mm').format(now),
    //   //   text: message,
    //   //   isLiked: false,
    //   //   unread: false,
    //   // );
    //
    // });
  }
  _buildMessage(String message, bool isMe) {
    final Container msg = Container(
      margin: isMe
          ? EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 80.0,
            )
          : EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
            ),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: isMe ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
        borderRadius: isMe
            ? BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              )
            : BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Text(
          //   message.sender.name + ' - ' + message.time,
          //   style: TextStyle(
          //     color: Colors.blueGrey,
          //     fontSize: 16.0,
          //     fontWeight: FontWeight.w600,
          //   ),
          // ),
          SizedBox(height: 8.0),
          Text(
            message,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
    if (isMe) {
      return msg;
    }
    return Row(
      children: <Widget>[
        msg,
        // IconButton(
        //   icon: message.isLiked
        //       ? Icon(Icons.favorite)
        //       : Icon(Icons.favorite_border),
        //   iconSize: 30.0,
        //   color: message.isLiked
        //       ? Theme.of(context).primaryColor
        //       : Colors.blueGrey,
        //   onPressed: () {},
        // )
      ],
    );
  }

  _buildMessageComposer(int index, AsyncSnapshot<QuerySnapshot> snapshot) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) => setState(() {
                    message = value;
              }),
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {
              sendMessage(index, snapshot);
            },
          ),
        ],
      ),
    );
  }
  final Stream<QuerySnapshot> _chatStream = FirebaseFirestore.instance.collection('chats').snapshots();

  @override
  Widget build(BuildContext context) {
    final int index = widget.index;
    return StreamBuilder(
        stream: _chatStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          var messages = snapshot.data.docs[index].get('msgs');
          return Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            appBar: AppBar(
              title: Text(
                "Test",
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              elevation: 0.0,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.more_horiz),
                  iconSize: 30.0,
                  color: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),
            body: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                children: <Widget>[
                  Expanded(
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
                          reverse: true,
                          padding: EdgeInsets.only(top: 15.0),
                          itemCount: messages.length,
                          itemBuilder: (BuildContext context, int index) {
                            final String message = messages[index];
                            final bool isMe = false;
                            return _buildMessage(message, isMe);
                          },
                        ),
                      ),
                    ),
                  ),
                  _buildMessageComposer(index, snapshot),
                ],
              ),
            ),
          );
        }
    );

  }
}
