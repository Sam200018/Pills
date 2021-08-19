import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pills/respository/medicine/medicine_repository.dart';
import 'package:pills/respository/medicine/model/medicine.dart';
import 'package:pills/src/utils/validatos.dart';
import 'package:rxdart/rxdart.dart';
part 'addmedicine_event.dart';
part 'addmedicine_state.dart';

class AddmedicineBloc extends Bloc<AddMedicineEvent, AddMedicineState> {
  final MedicineFirebase medicineFirebase;

  AddmedicineBloc({required this.medicineFirebase})
      : super(AddMedicineState.empty());

  @override
  Stream<Transition<AddMedicineEvent, AddMedicineState>> transformEvents(
      Stream<AddMedicineEvent> events, transitionFn) {
    final nonDebounceStream = events.where((event) =>
        (event is! MedicineNameChanged &&
            event is! AmountChanged &&
            event is! AmountAbleChanged &&
            event is! ActiveCompoundChanged));

    final debounceStream = events
        .where((event) => (event is MedicineNameChanged ||
            event is AmountChanged ||
            event is AmountAbleChanged ||
            event is ActiveCompoundChanged))
        .debounceTime(Duration(milliseconds: 300));

    return super.transformEvents(
        nonDebounceStream.mergeWith([debounceStream]), transitionFn);
  }

  @override
  Stream<AddMedicineState> mapEventToState(
    AddMedicineEvent event,
  ) async* {
    if (event is MedicineNameChanged) {
      yield* _mapNameMedicineChangedToState(event.name);
    }
    if (event is AmountChanged) {
      yield* _mapAmountChangedToState(event.amount);
    }
    if (event is AmountAbleChanged) {
      yield* _mapAmountAbleChangedToState(event.amountAble);
    }
    if (event is ActiveCompoundChanged) {
      yield* _mapActiveCompoundChangedToSate(event.activeCompound);
    }
  }

  Stream<AddMedicineState> _mapNameMedicineChangedToState(String name) async* {
    yield state.update(isMedicineNameValid: Validators.isValidNames(name));
  }

  Stream<AddMedicineState> _mapAmountChangedToState(double amount) async* {
    yield state.update(isAmountValid: Validators.isValidAmount(amount));
  }

  Stream<AddMedicineState> _mapAmountAbleChangedToState(
      double amountAble) async* {
    yield state.update(isAmountAbleValid: Validators.isValidAmount(amountAble));
  }

  Stream<AddMedicineState> _mapActiveCompoundChangedToSate(
      String activeCompound) async* {
    yield state.update(
        isActiveCompoundValid: Validators.isValidNames(activeCompound));
  }
}
