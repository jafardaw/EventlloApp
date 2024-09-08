class EventPlannerModel {
  final int id;
  final String title;
  final String description;
  final String date;
  final String time;
  final String location;
  final String budget;
  final String status;

  EventPlannerModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.location,
    required this.budget,
    required this.status,
  });

  factory EventPlannerModel.fromJson(Map<String, dynamic> json) {
    return EventPlannerModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: json['date'],
      time: json['time'],
      location: json['location'],
      budget: json['budget'],
      status: json['status'],
    );
  }
}
