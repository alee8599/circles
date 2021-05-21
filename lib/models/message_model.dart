import 'package:circles/models/user_model.dart';

class Message {
  final String chat_id;
  final CirclesUser sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    this.chat_id,
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unread,
  });
}

// YOU - current user
final CirclesUser currentUser = CirclesUser(
    id: '0',
    name: 'Me',
    imageUrl: 'lib/assets/images/penguin.jpg',
    email: 'test@email.com');

// USERS
final CirclesUser alex = CirclesUser(
    id: '1',
    name: 'Alex',
    imageUrl: 'lib/assets/images/Finished.jpg',
    email: 'test@email.com');
final CirclesUser ryan = CirclesUser(
    id: '2',
    name: 'Ryan',
    imageUrl: 'lib/assets/images/penguin.jpg',
    email: 'test@email.com');
final CirclesUser john = CirclesUser(
    id: '3',
    name: 'John',
    imageUrl: 'lib/assets/images/fountain.jpg',
    email: 'test@email.com');
final CirclesUser nandita = CirclesUser(
    id: '3',
    name: 'Nandita',
    imageUrl: 'lib/assets/images/circles_logo.jpg',
    email: 'test@email.com');


// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    chat_id: 'Knitting Club',
    sender: nandita,
    time: '17:30',
    text: 'Of course, see you all later!',
    isLiked: false,
    unread: true,
  ),
  Message(
    chat_id: 'Board Games',
    sender: john,
    time: '16:30',
    text: 'Of course, see you all later!',
    isLiked: false,
    unread: true,
  ),
  Message(
    chat_id: 'Hike the Dish',
    sender: alex,
    time: '15:30',
    text: 'Of course, see you all later!',
    isLiked: false,
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    chat_id: 'Knitting Club',
    sender: nandita,
    time: 'May 03, 17:30',
    text: 'Of course, see you all later!',
    isLiked: true,
    unread: true,
  ),
  Message(
    chat_id: 'Knitting Club',
    sender: currentUser,
    time: 'May 03, 16:30',
    text: 'Bet. Sounds good!! Super excited to see you all.',
    isLiked: false,
    unread: true,
  ),
  Message(
    chat_id: 'Knitting Club',
    sender: alex,
    time: 'May 03, 15:30',
    text: 'Bringing drinks and snacks',
    isLiked: false,
    unread: true,
  ),
  Message(
    chat_id: 'Knitting Club',
    sender: ryan,
    time: 'May 03, 15:15',
    text: 'Lots of them',
    isLiked: true,
    unread: true,
  ),
  Message(
    chat_id: 'Knitting Club',
    sender: currentUser,
    time: 'May 03, 14:30',
    text: 'Nice! What kind of food did you get?',
    isLiked: false,
    unread: true,
  ),
  Message(
    chat_id: 'Knitting Club',
    sender: ryan,
    time: 'May 03, 14:00',
    text: 'I ordered the food.',
    isLiked: false,
    unread: true,
  ),
];
