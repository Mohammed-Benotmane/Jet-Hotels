import 'package:flutter/material.dart';
import 'package:jethotels/screens/hotels_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Hotels_List(),
    Hotels_List(),
    Hotels_List(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor:  Colors.grey.shade300,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
              title: Text("")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
              title: Text("")
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.grey.shade800,
        onTap: _onItemTapped,
      ),
    );
  }


}
