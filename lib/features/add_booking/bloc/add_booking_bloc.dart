import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_booking_event.dart';
part 'add_booking_state.dart';

class AddBookingBloc extends Bloc<AddBookingEvent, AddBookingState> {
  AddBookingBloc() : super(AddBookingInitial()) {
    on<AddBookingEvent>((event, emit) {
      // TODO: Add event functionality
    });
  }
}
