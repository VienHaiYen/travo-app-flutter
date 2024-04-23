class SeatBookingState {
  int rowInd;
  int colInd;

  SeatBookingState({required this.rowInd, required this.colInd});

  factory SeatBookingState.initial() {
    return SeatBookingState(rowInd: -1, colInd: -1);
  }
}
