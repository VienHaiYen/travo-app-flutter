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
          ...List.generate(row, (index) => index).map<Row>((index) {
            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7.0),
                  child: SeatWidget(
                    state: widget.seats[currentRow][index],
                    rowInd: currentRow,
                    colInd: index,
                  ),
                ),
                index + 1 == row / 2
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          '${currentRow + 1}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      )
                    : Container()
              ],
            );
          })
        ],
      );
    }).toList();
    return ListView(children: rows);
  }
}
