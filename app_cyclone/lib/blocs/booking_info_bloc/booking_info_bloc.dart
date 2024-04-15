import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_event.dart';
import 'package:app_cyclone/blocs/booking_info_bloc/booking_info_state.dart';
import 'package:app_cyclone/travo_app_ac/models/booking.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingInfoBloc extends Bloc<BookingInfoEvent, BookingInfoState> {
  BookingInfoBloc() : super(BookingInfoState.init()) {
    on<UpdateBookingInfoEvent>((event, emit) {
      print('eventww ${event.guest ?? null}');
      print('event }');
      emit(BookingInfoState(
          room: state.room,
          currentBooking: Booking(
              date_end: event.date_end ?? state.currentBooking.date_end,
              date_start: event.date_start ?? state.currentBooking.date_start,
              email:
                  event.email == "" ? state.currentBooking.email : event.email,
              guest: event.guest.isEmpty
                  ? state.currentBooking.guest
                  : event.guest,
              hotel:
                  event.hotel == "" ? state.currentBooking.hotel : event.hotel,
              payment_card_info: event.payment_card_info,
              promo_code: event.promo_code ?? state.currentBooking.promo_code,
              room: event.room == "" ? state.currentBooking.room : event.room,
              typePayment: event.typePayment == ""
                  ? state.currentBooking.typePayment
                  : event.typePayment,
              userId: event.userId == ""
                  ? state.currentBooking.userId
                  : event.userId)));
    });
    on<UpdateRoomEvent>((event, emit) {
      // print('456 room');
      // print(event.room.hotel);
      emit(BookingInfoState(
          currentBooking: state.currentBooking, room: event.room));
    });
    on<ClearBookingInfoEvent>((event, emit) {
      emit(BookingInfoState.init());
    });
  }
}
