import 'package:equatable/equatable.dart';
import 'dart:convert';

class User extends Equatable {
  final String id;
  final String name;
  final String lastName;
  final String email;
  final bool isInTheHouse;
  final String house;

  const User({
    required this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.isInTheHouse,
    required this.house,
  });

  static const empty = User(
      email: '',
      id: '',
      name: '',
      lastName: '',
      house: '',
      isInTheHouse: false);

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        lastName: json["lastName"],
        email: json["email"],
        isInTheHouse: json["isInTheHouse"],
        house: json["house"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "lastName": lastName,
        "email": email,
        "IsInTheHouse": isInTheHouse,
        "house": house,
      };

  @override
  List<Object> get props => [email, id, name, lastName, isInTheHouse, house];
}
