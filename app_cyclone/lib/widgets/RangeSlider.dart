import 'package:flutter/material.dart';

class CustomRangeSlider extends StatefulWidget {
  const CustomRangeSlider({super.key, required this.max});

  final double max;

  @override
  State<CustomRangeSlider> createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
  RangeValues _currentRangeValues = const RangeValues(100, 400);

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: _currentRangeValues,
      max: widget.max,
      divisions: 5,
      labels: RangeLabels(
        _currentRangeValues.start.round().toString(),
        _currentRangeValues.end.round().toString(),
      ),
      onChanged: (RangeValues values) {
        setState(() {
          _currentRangeValues = values;
        });
      },
    );
  }
}
