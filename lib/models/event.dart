class Event {
  final String name;
  final String location;
  final String hostName;
  final DateTime dateTime;
  final String description;
  final List<String> participants;

  Event(this.name, this.location, this.hostName, this.dateTime,
      this.description, this.participants);
}
