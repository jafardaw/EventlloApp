class Event {
  final int id;
  final String title;
  final String description;
  final String date;
  final String time;
  final String location;
  final String budget;
  final String rate;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.location,
    required this.budget,
    required this.rate,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: json['date'],
      time: json['time'],
      location: json['location'],
      budget: json['budget'],
      rate: json['rate'],
    );
  }
}
