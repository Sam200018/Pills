part of 'addmedicine_bloc.dart';

abstract class AddMedicineEvent extends Equatable {
  const AddMedicineEvent();

  @override
  List<Object> get props => [];
}

class MedicineNameChanged extends AddMedicineEvent {
  final String name;

  MedicineNameChanged({@required this.name});

  @override
  List<Object> get props => [name];
}

class AmountChanged extends AddMedicineEvent {
  final double amount;

  AmountChanged({@required this.amount});

  @override
  List<Object> get props => [amount];
}

class AmountAbleChanged extends AddMedicineEvent {
  final double amountAble;

  AmountAbleChanged({@required this.amountAble});

  @override
  List<Object> get props => [amountAble];
}

class ActiveCompoundChanged extends AddMedicineEvent {
  final String activeCompound;

  ActiveCompoundChanged({@required this.activeCompound});

  @override
  List<Object> get props => [activeCompound];
}

class SubmittingForm extends AddMedicineEvent {
  final Medicine medicine;

  SubmittingForm({@required this.medicine});

  @override
  List<Object> get props => [medicine];
}
