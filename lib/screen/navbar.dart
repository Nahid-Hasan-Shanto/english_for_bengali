import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  String eventType = 'increment';

  changeIndex(et) {
    //print(et);
    Navigator.defaultRouteName;
    // setState(() {
    //   _selectedIndex = et;
    //   if (et == 0) {
    //     eventType = 'decrement';
    //   } else if (et == 1) {
    //     eventType = 'init';
    //   } else {
    //     eventType = 'increment';
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.arrow_back_ios_rounded),
          //   label: 'Back',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.arrow_forward_ios_rounded),
          //   label: 'Next',
          // ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: changeIndex,
      ),
    );
  }
}
