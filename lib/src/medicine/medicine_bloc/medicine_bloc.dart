import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pills/respository/medicine/model/medicine.dart';

part 'medicine_event.dart';
part 'medicine_state.dart';

class MedicineBloc extends Bloc<MedicineEvent, MedicineState> {
  MedicineBloc() : super(MedicineInitial());

  @override
  Stream<MedicineState> mapEventToState(
    MedicineEvent event,
  ) async* {}
}
