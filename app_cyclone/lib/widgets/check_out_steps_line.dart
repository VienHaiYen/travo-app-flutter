import 'package:flutter/material.dart';

class CheckOutStepsLine extends StatelessWidget {
  CheckOutStepsLine({Key? key, required this.stepNum, required this.steps})
      : super(key: key);

  final int stepNum;
  List<String> steps;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: steps
          .map((e) => _buildItemCheckOutStep(
              steps.indexOf(e) + 1,
              e,
              steps.indexOf(e) == steps.length - 1,
              steps.indexOf(e) == stepNum - 1,
              context))
          .toList(),
    );
  }

  Widget _buildItemCheckOutStep(
    int step,
    String nameStep,
    bool isEnd,
    bool isCheck,
    BuildContext context,
  ) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isCheck
                ? Theme.of(context).cardColor
                : Theme.of(context).cardColor.withOpacity(0.1),
          ),
          alignment: Alignment.center,
          child: Text(
            step.toString(),
            style: TextStyle(
              color: isCheck ? null : Theme.of(context).cardColor,
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(nameStep,
            style: TextStyle(color: Theme.of(context).cardColor, fontSize: 12)),
        const SizedBox(
          width: 8,
        ),
        if (!isEnd)
          SizedBox(
            width: 10,
            child: Divider(
              height: 1,
              thickness: 1,
              color: Theme.of(context).cardColor,
            ),
          ),
        if (!isEnd)
          const SizedBox(
            width: 8,
          ),
      ],
    );
  }
}
