import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class Medicine {
  Medicine({
    this.id,
    required this.name,
    required this.compuestosActivos,
    required this.cantidad,
    required this.disponible,
    required this.fechaDeCaducidad,
    this.reason,
  });

  String? id;
  String name;
  List<String> compuestosActivos;
  DateTime fechaDeCaducidad;
  double cantidad;
  double disponible;
  String? reason;

  factory Medicine.fromJson(String str) => Medicine.fromMap(json.decode(str));

  factory Medicine.empty() => Medicine(
      id: null,
      name: '',
      compuestosActivos: [],
      fechaDeCaducidad: DateTime.now(),
      cantidad: 0.0,
      disponible: 0.0,
      reason: null);

  Medicine copyWith({
    String? name,
    List<String>? compuestosActivos,
    DateTime? fechaDeCaducidad,
    double? cantidad,
    double? disponible,
    String? reason,
  }) {
    return Medicine(
      name: name ?? this.name,
      compuestosActivos: compuestosActivos ?? this.compuestosActivos,
      cantidad: cantidad ?? this.cantidad,
      disponible: disponible ?? this.disponible,
      fechaDeCaducidad: fechaDeCaducidad ?? this.fechaDeCaducidad,
      reason: reason ?? this.reason,
    );
  }

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
      reason: snapshot.get('reason'),
    );
  }

  factory Medicine.fromMap(Map<String, dynamic> json) => Medicine(
        name: json["name"],
        compuestosActivos:
            List<String>.from(json["compuestosActivos"].map((x) => x)),
        cantidad: json["cantidad"],
        disponible: json["disponible"],
        fechaDeCaducidad: DateTime.parse(json["fechaDeCaducidad"]),
        reason: json["reason"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "compuestosActivos":
            List<dynamic>.from(compuestosActivos.map((x) => x)),
        "cantidad": cantidad,
        "disponible": disponible,
        "fechaDeCaducidad": fechaDeCaducidad.toIso8601String(),
        "reason": reason,
      };

  @override
  String toString() {
    return '${this.id} ${this.name} ${this.fechaDeCaducidad} ${super.toString()}';
  }
}
