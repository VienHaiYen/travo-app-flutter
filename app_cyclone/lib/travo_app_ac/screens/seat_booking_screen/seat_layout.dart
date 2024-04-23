import 'package:app_cyclone/travo_app_ac/enums/seat_state.dart';
import 'package:app_cyclone/travo_app_ac/screens/seat_booking_screen/seat_widget.dart';
import 'package:flutter/material.dart';

class SeatLayout extends StatefulWidget {
  SeatLayout({super.key, required this.seats});

  List<List<SeatState2>> seats;

  @override
  _SeatLayoutState createState() => _SeatLayoutState();
}

class _SeatLayoutState extends State<SeatLayout> {
  get gridDelegate => null;

  @override
  Widget build(BuildContext context) {
    int currentRow = -1;
    List<Widget> rows = List<int>.generate(
            widget.seats.length, (index) => widget.seats[index].length)
        .map<Row>((row) {
      currentRow++;
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(row, (index) => index).map<SeatWidget>((index) {
            return SeatWidget(
              state: widget.seats[currentRow][index],
              rowInd: currentRow,
              colInd: index,
            );
          })
        ],
      );
    }).toList();
    return ListView(children: rows);
  }
}
