import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  DescriptionTextWidget({required this.text});

  @override
  _DescriptionTextWidgetState createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  late String firstHalf;
  late String secondHalf;

  ValueNotifier<bool> flag = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 100) {
      firstHalf = widget.text.substring(0, 100);
      secondHalf = widget.text.substring(100, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: secondHalf.isEmpty
            ? Text(firstHalf)
            : ValueListenableBuilder(
                valueListenable: flag,
                builder: (context, value, child) => Column(
                  children: <Widget>[
                    RichText(
                        text: TextSpan(
                            text: flag.value
                                ? (firstHalf + "...")
                                : (firstHalf + secondHalf),
                            style: const TextStyle(color: Colors.black),
                            children: [
                          TextSpan(
                              text: flag.value
                                  ? AppLocalizations.of(context)!.show_more
                                  : AppLocalizations.of(context)!.show_less,
                              style: TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => flag.value = !value)
                        ])),
                    // Text(flag.value
                    //     ? (firstHalf + "...")
                    //     : (firstHalf + secondHalf)),
                    // InkWell(
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     children: <Widget>[
                    //       Text(
                    //         flag.value
                    //             ? AppLocalizations.of(context)!.show_more
                    //             : AppLocalizations.of(context)!.show_less,
                    //         style: const TextStyle(color: Colors.blue),
                    //       ),
                    //     ],
                    //   ),
                    //   onTap: () {
                    //     flag.value = !value;
                    //   },
                    // ),
                  ],
                ),
              ));
  }
}
