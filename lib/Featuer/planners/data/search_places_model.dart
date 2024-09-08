class SearchPlacesModel {
  final int id;
  final String name;
  final String address;
  final String capacity;
  final String rate;
  final DateTime createdAt;
  final DateTime updatedAt;

  SearchPlacesModel({
    required this.id,
    required this.name,
    required this.address,
    required this.capacity,
    required this.rate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SearchPlacesModel.fromJson(Map<String, dynamic> json) {
    return SearchPlacesModel(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      capacity: json['capacity'],
      rate: json['rate'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'capacity': capacity,
      'rate': rate,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
