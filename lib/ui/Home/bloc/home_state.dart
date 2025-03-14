part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class InHouseState extends HomeState {}

class NotHouseState extends HomeState {}

class ErrorHouseState extends HomeState {}
