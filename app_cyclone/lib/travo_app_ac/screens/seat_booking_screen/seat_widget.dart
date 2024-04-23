import 'package:app_cyclone/blocs/seat_bloc/seat_booking_bloc.dart';
import 'package:app_cyclone/blocs/seat_bloc/seat_booking_event.dart';
import 'package:app_cyclone/blocs/seat_bloc/seat_booking_state.dart';
import 'package:app_cyclone/travo_app_ac/enums/seat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SeatWidget extends StatefulWidget {
  SeatWidget(
      {super.key,
      required this.state,
      required this.rowInd,
      required this.colInd});
  SeatState2 state;
  int rowInd;
  int colInd;

  @override
  State<SeatWidget> createState() => _SeatWidgetState();
}

class _SeatWidgetState extends State<SeatWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: widget.state == SeatState2.available
            ? _AvalableSeat(
                colInd: widget.colInd,
                rowInd: widget.rowInd,
              )
            : _SoldSeat(colInd: widget.colInd, rowInd: widget.rowInd));
  }
}

class _AvalableSeat extends StatelessWidget {
  int rowInd;
  int colInd;
  _AvalableSeat({required this.colInd, required this.rowInd});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<SeatBookingBloc>(context)
            .add(AddSeat(rowInd: rowInd, colInd: colInd));
      },
      child: BlocBuilder<SeatBookingBloc, SeatBookingState>(
          builder: (context, state) {
        return SvgPicture.asset(
          state.colInd == colInd && state.rowInd == rowInd
              ? 'assets/svg/svg_selected_seat.svg'
              : 'assets/svg/svg_unselected_seat.svg',
          height: 50,
          width: 50,
          fit: BoxFit.cover,
        );
      }),
    );
  }
}

class _SoldSeat extends StatelessWidget {
  int rowInd;
  int colInd;
  _SoldSeat({required this.colInd, required this.rowInd});
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/svg_sold_seat.svg',
      height: 50,
      width: 50,
      fit: BoxFit.cover,
    );
  }
}
