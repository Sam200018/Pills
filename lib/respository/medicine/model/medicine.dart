import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Medicine extends Equatable {
  Medicine({
    this.id,
    this.name,
    this.compuestosActivos,
    this.fechaDeCaducidad,
    this.cantidad,
    this.disponible,
  });

  final String id;
  final String name;
  final List<String> compuestosActivos;
  final DateTime fechaDeCaducidad;
  final double cantidad;
  final double disponible;

  factory Medicine.fromJson(String str) => Medicine.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  static Medicine fromSnapshot(DocumentSnapshot snapshot) {
    return Medicine(
      cantidad: snapshot.get('cantidad').toDouble(),
      disponible: snapshot.get('disponible').toDouble(),
      name: snapshot.get('name'),
      fechaDeCaducidad: DateTime.parse(
        snapshot.get('fechaDeCaducidad').toDate().toString(),
      ),
      compuestosActivos: List.from(snapshot.get('compuestosActivos')),
      id: snapshot.id,
    );
  }

  factory Medicine.fromMap(Map<String, dynamic> json) => Medicine(
        id: json["id"],
        name: json["name"],
        compuestosActivos:
            List<String>.from(json["compuestosActivos"].map((x) => x)),
        fechaDeCaducidad: DateTime.parse(json["fechaDeCaducidad"]),
        cantidad: json["cantidad"].toDouble(),
        disponible: json["disponible"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "compuestosActivos":
            List<dynamic>.from(compuestosActivos.map((x) => x)),
        "fechaDeCaducidad": fechaDeCaducidad.toIso8601String(),
        "cantidad": cantidad,
        "disponible": disponible,
      };

  @override
  List<Object> get props =>
      [id, name, compuestosActivos, fechaDeCaducidad, cantidad, disponible];
}
