import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pills/respository/repository.dart';
import 'package:pills/shared_preferences/shared_preferences.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final prefs = new SharedPreferencesUser();
  final medicineHouse = MedicineFirebase();

  HomeBloc() : super(HomeInitial()) {
    on<HouseChecked>(_onHouseCheckedToState);
    on<LeftHouse>(_onLeftHouseToState);
    on<CreatedHouse>(_onCreatedHouseToState);
    on<JoinedHose>(_onJoinedHouseToState);
  }

  void _onHouseCheckedToState(
      HouseChecked event, Emitter<HomeState> emit) async {
    try {
      // Preguntamos a SharedPreferences su house:String  es null o si existe
      if (prefs.houseId == '') {
        // true=> preguntamos a firestore/Api si house es null
        String? houseID = await medicineHouse.houseID();
        if (houseID == null) {
          //      // True=>
          emit(NotHouseState());
        } else {
          // escribimos en SharedPreference el house:String
          prefs.houseId = houseID;
          emit(InHouseState());
        }
      } else {
        emit(InHouseState());
      }
    } catch (e) {
      print(e);
      emit(ErrorHouseState());
    }
  }

  void _onLeftHouseToState(LeftHouse event, Emitter<HomeState> emit) {
    try {
      // le pedimos a Firestore/Api que elimine limpie el campo house
      // le pedimos a SharedPreferences que elimine house:string
      emit(NotHouseState());
    } catch (e) {
      emit(ErrorHouseState());
    }
  }

  void _onCreatedHouseToState(CreatedHouse event, Emitter<HomeState> emit) {
    //pedimos a Firestore/Api que cree una casa para nosotros
    add(HouseChecked());
  }

  void _onJoinedHouseToState(JoinedHose event, Emitter<HomeState> emit) {
    //enviamos a Firestore/Api el even.houseId
    add(HouseChecked());
  }
}
