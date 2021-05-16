import 'package:circles/models/user_model.dart';

class Message {
  final CirclesUser sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
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
    name: 'Current User',
    imageUrl: 'lib/assets/images/penguin.jpg',
    email: 'test@email.com');

// USERS
final CirclesUser greg = CirclesUser(
    id: '1',
    name: 'Greg',
    imageUrl: 'lib/assets/images/penguin.jpg',
    email: 'test@email.com');
final CirclesUser james = CirclesUser(
    id: '2',
    name: 'James',
    imageUrl: 'lib/assets/images/penguin.jpg',
    email: 'test@email.com');
final CirclesUser john = CirclesUser(
    id: '3',
    name: 'John',
    imageUrl: 'lib/assets/images/penguin.jpg',
    email: 'test@email.com');
final CirclesUser olivia = CirclesUser(
    id: '4',
    name: 'Olivia',
    imageUrl: 'lib/assets/images/penguin.jpg',
    email: 'test@email.com');
final CirclesUser sam = CirclesUser(
    id: '5',
    name: 'Sam',
    imageUrl: 'lib/assets/images/penguin.jpg',
    email: 'test@email.com');
final CirclesUser sophia = CirclesUser(
    id: '6',
    name: 'Sophia',
    imageUrl: 'lib/assets/images/penguin.jpg',
    email: 'test@email.com');
final CirclesUser steven = CirclesUser(
    id: '7',
    name: 'Steven',
    imageUrl: 'lib/assets/images/penguin.jpg',
    email: 'test@email.com');

// FAVORITE CONTACTS
List<CirclesUser> favorites = [sam, steven, olivia, john, greg];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: olivia,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: john,
    time: '3:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sophia,
    time: '2:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: steven,
    time: '1:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sam,
    time: '12:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: greg,
    time: '11:30 AM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Just walked my doge. She was super duper cute. The best pupper!!',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:45 PM',
    text: 'How\'s the doggo?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '3:15 PM',
    text: 'All the food',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Nice! What kind of food did you eat?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    isLiked: false,
    unread: true,
  ),
];
