import 'package:app_cyclone/blocs/seat_bloc/seat_booking_event.dart';
import 'package:app_cyclone/blocs/seat_bloc/seat_booking_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatBookingBloc extends Bloc<SeatBookingEvent, SeatBookingState> {
  SeatBookingBloc() : super(SeatBookingState.initial()) {
    on<AddSeat>((event, emit) {
      emit(SeatBookingState(
        colInd: state.colInd == event.colInd && state.rowInd == event.rowInd
            ? -1
            : event.colInd,
        rowInd: state.colInd == event.colInd && state.rowInd == event.rowInd
            ? -1
            : event.rowInd,
      ));
    });
  }
}
