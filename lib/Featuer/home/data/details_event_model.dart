class DetaileEvent {
  final int id;
  final String title;
  final String description;
  final String date;
  final String time;
  final String location;
  final String budget;
  final String rate;
  final DateTime createdAt;
  final DateTime updatedAt;

  DetaileEvent({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.location,
    required this.budget,
    required this.rate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DetaileEvent.fromJson(Map<String, dynamic> json) {
    return DetaileEvent(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: json['date'],
      time: json['time'],
      location: json['location'],
      budget: json['budget'],
      rate: json['rate'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
