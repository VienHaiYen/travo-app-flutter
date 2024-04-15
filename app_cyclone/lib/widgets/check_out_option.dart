import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CheckOutOption extends StatelessWidget {
  const CheckOutOption(
      {super.key,
      required this.icon,
      required this.title,
      required this.subAdd,
      required this.hasButton,
      this.bgColor,
      this.data,
      this.dataIcon,
      this.dataSize,
      this.onPressed,
      this.onWidgetTap});

  final Widget icon;
  final String title;
  final String subAdd;
  final String? data;
  final Widget? dataIcon;
  final double? dataSize;
  final void Function()? onPressed;
  final void Function()? onWidgetTap;
  final bool hasButton;
  final Color? bgColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onWidgetTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: bgColor ?? Colors.white,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                icon,
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            hasButton
                ? Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      data != null && data!.isNotEmpty
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Row(
                                    children: [
                                      dataIcon ?? Container(),
                                      Text(
                                        data ?? "",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: dataSize ?? 16),
                                      ),
                                    ],
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: onPressed,
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(10),
                                    backgroundColor:
                                        const Color.fromARGB(32, 224, 221, 245),
                                  ),
                                  child: const Text(
                                    "Change",
                                    style: TextStyle(
                                      color: Color.fromRGBO(97, 85, 204, 1),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : SizedBox(
                              width: 230,
                              child: ElevatedButton(
                                onPressed: onPressed,
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(10),
                                  backgroundColor:
                                      const Color.fromRGBO(224, 221, 245, 1),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.white,
                                      ),
                                      alignment: Alignment.center,
                                      child: const Icon(
                                        Icons.add,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      subAdd,
                                      style: const TextStyle(
                                        color: Color.fromRGBO(97, 85, 204, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    ],
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
