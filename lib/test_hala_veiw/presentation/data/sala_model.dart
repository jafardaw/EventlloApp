class SalaModel {
  final num? id;
  final String? name;
  final String? address;
  final String? capacity;
  final String? startWork;
  final String? endWork;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<SalaImageModel>? images;

  SalaModel({
    this.id,
    this.name,
    this.address,
    this.capacity,
    this.startWork,
    this.endWork,
    this.createdAt,
    this.updatedAt,
    this.images,
  });

  factory SalaModel.fromJson(Map<String, dynamic> json) {
    return SalaModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      capacity: json['capacity'] as String?,
      startWork: json['start_work'] as String?,
      endWork: json['end_work'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => SalaImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class SalaImageModel {
  final int? id;
  final int? placeId;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  SalaImageModel({
    this.id,
    this.placeId,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory SalaImageModel.fromJson(Map<String, dynamic> json) {
    return SalaImageModel(
      id: json['id'] as int?,
      placeId: json['place_id'] as int?,
      image: json['image'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
    );
  }
}