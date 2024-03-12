import 'package:flutter/material.dart';

class StopGeneratingButton extends StatelessWidget {
  const StopGeneratingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return OutlinedButton(

      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9),
        ),
        side: const BorderSide(
          color: Color(0xffe3e3e3),
        ),
      ),
      onPressed: () {},
      child: Container(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: const Color(0xff17c3ce),
              ),
            ),
            const SizedBox(width: 15),
            Text(
              'Stop generating...',
              style: theme.textTheme.bodyLarge?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
