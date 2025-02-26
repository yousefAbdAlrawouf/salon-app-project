import 'package:salon_app/core/models/user_model.dart';

class AuthResponseModel {
  final String token;
  final String role;
  final UserModel user;

  AuthResponseModel({
    required this.token,
    required this.role,
    required this.user,
  });

  AuthResponseModel copyWith({
    String? token,
    String? role,
    UserModel? user,
  }) =>
      AuthResponseModel(
        token: token ?? this.token,
        role: role ?? this.role,
        user: user ?? this.user,
      );

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    if (data == null) {
      throw Exception(
          "Missing 'data' key in JSON");
    }

    return AuthResponseModel(
      token: data['token'] ?? '', 
      role: data['role'] ?? '',
      user: UserModel.fromJson(data['user']),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": {
          "token": token,
          "role": role,
          "user": user.toJson(),
        }
      };
}
