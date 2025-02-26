
class CategoryModel {
  final int id;
  final int status;
  final String type;
 // final String createdAt;
  final String name;
  final String image;

  CategoryModel({
    required this.id,
    required this.status,
    required this.type,
   // required this.createdAt,
    required this.name,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      status: json['status'],
      type: json['type'],
      //createdAt: json['created_at'],
      name: json['name'],
      image: json['image'],
    );
  }

  CategoryModel copyWith({
    int? id,
    int? status,
    String? type,
    //String? createdAt,
    String? name,
    String? image,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      status: status ?? this.status,
      type: type ?? this.type,
      //createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }
}