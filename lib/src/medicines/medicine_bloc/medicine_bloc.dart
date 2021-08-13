import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:pills/respository/medicine/medicine_repository.dart';
import 'package:pills/respository/medicine/model/medicine.dart';
part 'medicine_event.dart';
part 'medicine_state.dart';

class MedicineBloc extends Bloc<MedicineEvent, MedicineState> {
  final MedicineFirebase _medicinesRepository;
  StreamSubscription? _medicinesSubscription;

  MedicineBloc(this._medicinesRepository) : super(MedicineInitial());

  @override
  Stream<MedicineState> mapEventToState(
    MedicineEvent event,
  ) async* {
    if (event is LoadMedicines) {
      yield* _mapLoadMedicinesToState();
    } else if (event is AddMedicine) {
      yield* _mapAddMedicineToState(event);
    } else if (event is UpdateMedicine) {
      yield* _mapUpdateMedicineToState(event);
    } else if (event is DeleteMedicine) {
      yield* _mapDeleteMedicineToState(event);
    } else if (event is MedicinesUpdated) {
      yield* _mapMedicinesUpdateToState(event);
    }
  }

  Stream<MedicineState> _mapLoadMedicinesToState() async* {
    _medicinesSubscription?.cancel();
    try {
      _medicinesSubscription = _medicinesRepository
          .medicines()
          .listen((medicines) => add(MedicinesUpdated(medicines)));
    } catch (e) {
      yield MedicinesNotLoaded();
    }
  }

  Stream<MedicineState> _mapAddMedicineToState(AddMedicine event) async* {
    _medicinesRepository.addNewMedicine(event.medicine);
  }

  Stream<MedicineState> _mapUpdateMedicineToState(
      UpdateMedicine event) async* {}

  Stream<MedicineState> _mapDeleteMedicineToState(DeleteMedicine event) async* {
    _medicinesRepository.deleteMedicine(event.medicine);
  }

  Stream<MedicineState> _mapMedicinesUpdateToState(
      MedicinesUpdated event) async* {
    yield MedicinesLoaded(event.medicines);
  }

  @override
  Future<void> close() {
    _medicinesSubscription?.cancel();
    return super.close();
  }
}
