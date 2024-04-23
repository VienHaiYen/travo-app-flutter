class SeatBookingEvent {}

class CancelSeat extends SeatBookingEvent {}

class AddSeat extends SeatBookingEvent {
  int rowInd;
  int colInd;

  AddSeat({required this.rowInd, required this.colInd});
}
