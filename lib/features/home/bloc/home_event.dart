part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {}

class FetchSchedules extends HomeEvent {
  @override
  List<Object?> get props => [];
}
