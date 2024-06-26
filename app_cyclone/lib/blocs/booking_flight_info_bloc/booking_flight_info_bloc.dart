import 'package:app_cyclone/blocs/booking_flight_info_bloc/booking_flight_info_event.dart';
import 'package:app_cyclone/blocs/booking_flight_info_bloc/booking_flight_info_state.dart';
import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_state.dart';
import 'package:app_cyclone/travo_app_ac/models/booking.dart';
import 'package:app_cyclone/travo_app_ac/models/booking_flight.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingFlightInfoBloc
    extends Bloc<BookingFlightInfoEvent, BookingFlightInfoState> {
  BookingFlightInfoBloc() : super(BookingFlightInfoState.init()) {
    on<UpdateBookingFlightInfoEvent>((event, emit) {
      // print('event ${event.promo_code}');
      // print('event ${state.currentBooking.guest} ${event.guest!.length}');
      emit(BookingFlightInfoState(
          flight: state.flight,
          currentBooking: BookingFlight(
            createdAt: event.createdAt ?? state.currentBooking.createdAt,
            email: event.email == "" ? state.currentBooking.email : event.email,
            guest: event.guest == null || event.guest == []
                ? state.currentBooking.guest
                : event.guest,
            seat: event.seat ?? state.currentBooking.seat,
            flight:
                event.flight == "" ? state.currentBooking.flight : event.flight,
            card: event.card ?? state.currentBooking.card,
            promoCode: event.promoCode ?? state.currentBooking.promoCode,
            typePayment: event.typePayment == ""
                ? state.currentBooking.typePayment
                : event.typePayment,
          )));
    });
    on<UpdateFlightEvent>((event, emit) {
      print('updated flight');
      emit(BookingFlightInfoState(
          currentBooking: state.currentBooking, flight: event.flight));
    });
    on<ClearBookingFlightInfoEvent>((event, emit) {
      emit(BookingFlightInfoState.init());
    });
  }
}
