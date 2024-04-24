import "package:app_cyclone/travo_app_ac/screens/favorite_screen/favorite_screen.dart";
import "package:app_cyclone/travo_app_ac/screens/history_screen/history_screen.dart";
import "package:app_cyclone/travo_app_ac/screens/home_screen/home_screen.dart";
import "package:app_cyclone/travo_app_ac/screens/user_screen/user_screen.dart";
import "package:app_cyclone/widgets/button.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../../../providers/auth_provider.dart";

class BottomNavigationLayout extends StatefulWidget {
  const BottomNavigationLayout({super.key, this.pageIndex});
  final int? pageIndex;
  @override
  _BottomNavigationLayoutState createState() => _BottomNavigationLayoutState();
}

class _BottomNavigationLayoutState extends State<BottomNavigationLayout> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    FavoriteScreen(),
    HistoryScreen(),
    UserScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedIndex = widget.pageIndex ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color.fromRGBO(97, 85, 204, 1)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Color.fromRGBO(97, 85, 204, 1)),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.briefcase,
                color: Color.fromRGBO(97, 85, 204, 1)),
            label: 'Work',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user,
                color: Color.fromRGBO(97, 85, 204, 1)),
            label: 'User',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
