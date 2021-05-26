import 'dart:convert';

class Circles {
  List<String> userIds;
  String id;
  String name;
  String description;

  Circles({this.userIds, this.id, this.name, this.description});

  Map<String, dynamic> toJson() {
    return {
      'userIDs': userIds,
      'id': id,
      'name': name,
      'description': description
    };
  }
}
