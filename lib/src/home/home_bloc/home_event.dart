part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HouseChecked extends HomeEvent {}

class LeftHouse extends HomeEvent {}

class CreatedHouse extends HomeEvent {}

class JoinedHose extends HomeEvent {
  final String houseID;

  JoinedHose(this.houseID);

  @override
  List<Object> get props => [houseID];
}
