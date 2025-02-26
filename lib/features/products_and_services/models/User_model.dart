
class UserModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String gender;
  final int active;
  final String image;
  final String type;
  final int userableId;
  final String createdAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.active,
    required this.image,
    required this.type,
    required this.userableId,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      gender: json['gender'],
      active: json['active'],
      image: json['image'],
      type: json['type'],
      userableId: json['userable_id'],
      createdAt: json['created_at'],
    );
  }

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? gender,
    int? active,
    String? image,
    String? type,
    int? userableId,
    String? createdAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      active: active ?? this.active,
      image: image ?? this.image,
      type: type ?? this.type,
      userableId: userableId ?? this.userableId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}