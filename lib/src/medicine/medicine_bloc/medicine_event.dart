part of 'medicine_bloc.dart';

abstract class MedicineEvent extends Equatable {
  const MedicineEvent();

  @override
  List<Object> get props => [];
}

class LoadMedicines extends MedicineEvent {}

class AddMedicine extends MedicineEvent {
  final Medicine medicine;

  AddMedicine(this.medicine);

  @override
  List<Object> get props => [medicine];

  @override
  String toString() => 'Add Medicine {medicine: $medicine}';
}

class UpdateMedicie extends MedicineEvent {
  final Medicine updateMedicine;

  UpdateMedicie(this.updateMedicine);

  @override
  List<Object> get props => [updateMedicine];

  @override
  String toString() => 'Update Medicine {medicine: $updateMedicine}';
}

class DeleteMedicine extends MedicineEvent {
  final Medicine medicine;

  DeleteMedicine(this.medicine);

  @override
  List<Object> get props => [medicine];

  @override
  String toString() => 'DeleteMedicine {medicine: $medicine}';
}

class MedicinesUpdated extends MedicineEvent {
  final List<Medicine> medicines;

  MedicinesUpdated(this.medicines);

  @override
  List<Object> get props => [medicines];
}
