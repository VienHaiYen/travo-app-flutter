import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar(
      {super.key,
      this.height = 80,
      required this.title,
      required this.showBackButton});

  final double height;
  final String title;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
        toolbarHeight: height,
        automaticallyImplyLeading: false,
        leading: showBackButton
            ? IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFF706C6C),
                ))
            : null,
        title: Text(title, style: theme.textTheme.headlineSmall),
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            thickness: 1,
            color: Colors.grey,
          ),
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
