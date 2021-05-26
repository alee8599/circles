import 'package:circles/models/user_model.dart';

class Chat {
  final String event_name;
  final List<String> users;
  final List<String> msgs;

  Chat({
    this.event_name,
    this.users,
    this.msgs,
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
List<Chat> chats = [
  Chat(
      event_name: 'Knitting Club',
      users: [],
      msgs: ['Test', 'Test','Test']
  ),
  Chat(
      event_name: 'Crotherhood',
      users: [],
      msgs: ['Test', 'Test','Test']
  ),
  Chat(
      event_name: 'Board Games',
      users: [],
      msgs: ['Test', 'Test','Test']
  ),
];

List<String> messages = ['Of course, see you all later!', 'Placeholder', 'Test'];
// EXAMPLE MESSAGES IN CHAT SCREEN
// List<Message> messages = [
//   Message(
//     chat_id: 'Knitting Club',
//     sender: nandita,
//     time: 'May 03, 17:30',
//     text: 'Of course, see you all later!',
//     isLiked: true,
//     unread: true,
//   ),
//   Message(
//     chat_id: 'Knitting Club',
//     sender: currentUser,
//     time: 'May 03, 16:30',
//     text: 'Bet. Sounds good!! Super excited to see you all.',
//     isLiked: false,
//     unread: true,
//   ),
//   Message(
//     chat_id: 'Knitting Club',
//     sender: alex,
//     time: 'May 03, 15:30',
//     text: 'Bringing drinks and snacks',
//     isLiked: false,
//     unread: true,
//   ),
//   Message(
//     chat_id: 'Knitting Club',
//     sender: ryan,
//     time: 'May 03, 15:15',
//     text: 'Lots of them',
//     isLiked: true,
//     unread: true,
//   ),
//   Message(
//     chat_id: 'Knitting Club',
//     sender: currentUser,
//     time: 'May 03, 14:30',
//     text: 'Nice! What kind of food did you get?',
//     isLiked: false,
//     unread: true,
//   ),
//   Message(
//     chat_id: 'Knitting Club',
//     sender: ryan,
//     time: 'May 03, 14:00',
//     text: 'I ordered the food.',
//     isLiked: false,
//     unread: true,
//   ),
// ];
