
import 'package:salon_app/core/models/user_model.dart';

class ProviderModel {
  final int id;
  final int showInHome;
  final int type;
  final String createdAt;
  final int? subscriptionId;
  final int order;
  final double? currencyPerPoint;
  final double? pointValue;
  final String name;
  final String bio;
  final int supportLoyaltyPoints;
  final UserModel? user;

  ProviderModel({
    required this.id,
    required this.showInHome,
    required this.type,
    required this.createdAt,
    this.subscriptionId,
    required this.order,
    this.currencyPerPoint,
    this.pointValue,
    required this.name,
    required this.bio,
    required this.supportLoyaltyPoints,
    this.user,
  });

  factory ProviderModel.fromJson(Map<String, dynamic> json) {
    return ProviderModel(
      id: json['id'],
      showInHome: json['show_in_home'],
      type: json['type'],
      createdAt: json['created_at'],
      subscriptionId: json['subscription_id'],
      order: json['order'],
      currencyPerPoint: json['currency_per_point'] != null
          ? (json['currency_per_point'] as num).toDouble()
          : null,
      pointValue: json['point_value'] != null
          ? (json['point_value'] as num).toDouble()
          : null,
      name: json['name'],
      bio: json['bio'],
      supportLoyaltyPoints: json['support_loyalty_points'],
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
    );
  }

  ProviderModel copyWith({
    int? id,
    int? showInHome,
    int? type,
    String? createdAt,
    int? subscriptionId,
    int? order,
    double? currencyPerPoint,
    double? pointValue,
    String? name,
    String? bio,
    int? supportLoyaltyPoints,
    UserModel? user,
  }) {
    return ProviderModel(
      id: id ?? this.id,
      showInHome: showInHome ?? this.showInHome,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      subscriptionId: subscriptionId ?? this.subscriptionId,
      order: order ?? this.order,
      currencyPerPoint: currencyPerPoint ?? this.currencyPerPoint,
      pointValue: pointValue ?? this.pointValue,
      name: name ?? this.name,
      bio: bio ?? this.bio,
      supportLoyaltyPoints: supportLoyaltyPoints ?? this.supportLoyaltyPoints,
      user: user ?? this.user,
    );
  }
}