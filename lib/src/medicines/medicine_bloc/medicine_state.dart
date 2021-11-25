part of 'medicine_bloc.dart';

abstract class MedicineState extends Equatable {
  const MedicineState();

  @override
  List<Object> get props => [];
}

class MedicineInitial extends MedicineState {}

class MedicinesLoaded extends MedicineState {
  final List<Medicine> medicines;

  MedicinesLoaded([this.medicines = const []]);

  @override
  List<Object> get props => [medicines];

  @override
  String toString() => 'MedicinesLoaded {medicines: $medicines}';
}

class MedicinesNotLoaded extends MedicineState {}

class MedicineDeleted extends MedicineState {}
