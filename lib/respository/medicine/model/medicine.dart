import 'dart:convert';

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
  final String fechaDeCaducidad;
  final double cantidad;
  final bool disponible;

  factory Medicine.fromJson(String str) => Medicine.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Medicine.fromMap(Map<String, dynamic> json) => Medicine(
        id: json["id"],
        name: json["name"],
        compuestosActivos:
            List<String>.from(json["compuestosActivos"].map((x) => x)),
        fechaDeCaducidad: json["fechaDeCaducidad"],
        cantidad: json["cantidad"].toDouble(),
        disponible: json["disponible"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "compuestosActivos":
            List<dynamic>.from(compuestosActivos.map((x) => x)),
        "fechaDeCaducidad": fechaDeCaducidad,
        "cantidad": cantidad,
        "disponible": disponible,
      };

  @override
  List<Object> get props =>
      [id, name, compuestosActivos, fechaDeCaducidad, cantidad, disponible];
}
