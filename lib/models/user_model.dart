class CirclesUser {
  final String id;
  final String name;
  final String imageUrl;
  final String email;

  CirclesUser({
    this.id,
    this.name,
    this.imageUrl,
    this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': this.name,
      'email': this.email,
      'imageUrl': this.imageUrl
    };
  }
}
