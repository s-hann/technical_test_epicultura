part of 'add_booking_bloc.dart';

sealed class AddBookingState extends Equatable {
  const AddBookingState();
  
  @override
  List<Object> get props => [];
}

final class AddBookingInitial extends AddBookingState {}
