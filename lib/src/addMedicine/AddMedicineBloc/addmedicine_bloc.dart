import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pills/respository/medicine/medicine_repository.dart';
import 'package:pills/respository/medicine/model/medicine.dart';
import 'package:pills/src/utils/validatos.dart';
part 'addmedicine_event.dart';
part 'addmedicine_state.dart';

class AddmedicineBloc extends Bloc<AddMedicineEvent, AddMedicineState> {
  final MedicineFirebase medicineFirebase;

  AddmedicineBloc({required this.medicineFirebase})
      : super(AddMedicineState.empty()) {
    on<MedicineNameChanged>(_onNameMedicineChangedToState);
    on<AmountChanged>(_onAmountChangedToState);
    on<AmountAbleChanged>(_onAmountAbleChangedToState);
    on<ActiveCompoundChanged>(_onActiveCompoundChangedToSate);
  }

  void _onNameMedicineChangedToState(
      MedicineNameChanged event, Emitter<AddMedicineState> emit) {
    emit(
        state.update(isMedicineNameValid: Validators.isValidNames(event.name)));
  }

  void _onAmountChangedToState(
      AmountChanged event, Emitter<AddMedicineState> emit) {
    emit(state.update(isAmountValid: Validators.isValidAmount(event.amount)));
  }

  void _onAmountAbleChangedToState(
      AmountAbleChanged event, Emitter<AddMedicineState> emit) {
    emit(state.update(
        isAmountAbleValid: Validators.isValidAmount(event.amountAble)));
  }

  void _onActiveCompoundChangedToSate(
      ActiveCompoundChanged event, Emitter<AddMedicineState> emit) {
    emit(state.update(
        isActiveCompoundValid: Validators.isValidNames(event.activeCompound)));
  }
}
