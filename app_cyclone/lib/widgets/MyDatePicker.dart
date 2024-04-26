import 'package:app_cyclone/widgets/ColorIcon.dart';
import 'package:flutter/material.dart';

class MyDatePicker extends StatefulWidget {
  MyDatePicker(
      {super.key, this.icon, required this.title, required this.selectedDate});

  final ValueNotifier<DateTime?> selectedDate;

  ColorIcon? icon;
  String title;

  @override
  _MyDatePickerState createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10)),
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
                        _showDatePicker();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).cardColor,
                          shadowColor: Theme.of(context).cardColor,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 0,
                          )),
                      child: ValueListenableBuilder<DateTime?>(
                          valueListenable: widget.selectedDate,
                          builder: (context, value, child) => Text(
                              widget.selectedDate.value != null
                                  ? ' ${widget.selectedDate.value!.day}/${widget.selectedDate.value!.month}/${widget.selectedDate.value!.year}'
                                  : 'dd/mm/yy',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)))))
            ],
          )
        ],
      ),
    );
  }

  Future<void> _showDatePicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (pickedDate != null && pickedDate != widget.selectedDate.value) {
      widget.selectedDate.value = pickedDate;
    }
  }
}
