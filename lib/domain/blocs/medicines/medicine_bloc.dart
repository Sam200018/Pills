import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pills/data/repository/medicine_repository.dart';
import 'package:pills/data/model/medicine.dart';
part 'medicine_event.dart';
part 'medicine_state.dart';

class MedicineBloc extends Bloc<MedicineEvent, MedicineState> {
  final MedicineFirebase _medicinesRepository = MedicineFirebase();
  StreamSubscription? _medicinesSubscription;

  MedicineBloc() : super(MedicineInitial()) {
    on<LoadMedicines>(_onLoadMedicinesToState);
    on<DeleteMedicine>(_onDeleteMedicineToState);
    on<MedicinesUpdated>(_onMedicinesUpdated);
  }

  void _onLoadMedicinesToState(
      LoadMedicines event, Emitter<MedicineState> emit) {
    _medicinesSubscription?.cancel();
    try {
      _medicinesSubscription = _medicinesRepository
          .medicines()
          .listen((medicines) => add(MedicinesUpdated(medicines)));
      // emit(MedicinesLoaded());
    } catch (e) {
      emit(MedicinesNotLoaded());
    }
  }

  void _onDeleteMedicineToState(
      DeleteMedicine event, Emitter<MedicineState> emit) {
    _medicinesRepository.deleteMedicine(event.medicine);
    emit(MedicineDeleted());
  }

  void _onMedicinesUpdated(
      MedicinesUpdated event, Emitter<MedicineState> emit) {
    emit(MedicinesLoaded(event.medicines));
  }

  @override
  Future<void> close() {
    _medicinesSubscription?.cancel();
    return super.close();
  }
}
