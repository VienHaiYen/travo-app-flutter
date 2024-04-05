import 'package:app_cyclone/widgets/ColorIcon.dart';
import 'package:flutter/material.dart';

class MyDateDisplay extends StatefulWidget {
  MyDateDisplay(
      {super.key, this.icon, required this.title, required this.selectedDate});

  final String selectedDate;

  ColorIcon? icon;
  String title;

  @override
  _MyDateDisplayState createState() => _MyDateDisplayState();
}

class _MyDateDisplayState extends State<MyDateDisplay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          widget.icon ?? Container(),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(
                  height: 20,
                  child: ElevatedButton(
                      onPressed: () {
                        // _showDatePicker();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shadowColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 0,
                          )),
                      child: Text(widget.selectedDate,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16))))
            ],
          )
        ],
      ),
    );
  }
}
