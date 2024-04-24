import 'package:flutter/material.dart';

class CustomRangeSlider extends StatefulWidget {
  const CustomRangeSlider(
      {super.key, required this.max, required this.rangeValue});

  final double max;
  final ValueNotifier<RangeValues> rangeValue;

  @override
  State<CustomRangeSlider> createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<RangeValues>(
        valueListenable: widget.rangeValue,
        builder: (context, value, child) {
          return RangeSlider(
            values: widget.rangeValue.value,
            max: widget.max,
            divisions: 40,
            labels: RangeLabels(
              widget.rangeValue.value.start.round().toString(),
              widget.rangeValue.value.end.round().toString(),
            ),
            onChanged: (RangeValues values) {
              widget.rangeValue.value = values;
            },
          );
        });
  }
}
