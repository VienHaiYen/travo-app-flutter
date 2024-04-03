import 'package:app_cyclone/widgets/ColorIcon.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MyDatePicker extends StatefulWidget {
  MyDatePicker({super.key, required this.icon, required this.title});

  ColorIcon icon;
  String title;

  @override
  _MyDatePickerState createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  final ValueNotifier<DateTime?> _selectedDate = ValueNotifier<DateTime?>(null);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        widget.icon,
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
                      _showDatePicker();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shadowColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 0,
                        )),
                    child: ValueListenableBuilder<DateTime?>(
                        valueListenable: _selectedDate,
                        builder: (context, value, child) => Text(
                            _selectedDate.value != null
                                ? ' ${_selectedDate.value!.day}/${_selectedDate.value!.month}/${_selectedDate.value!.year}'
                                : 'Select Date',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17)))))
          ],
        )
      ],
    ));
  }

  Future<void> _showDatePicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (pickedDate != null && pickedDate != _selectedDate.value) {
      _selectedDate.value = pickedDate;
    }
  }
}
