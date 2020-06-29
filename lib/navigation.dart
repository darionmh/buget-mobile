import 'package:flutter/material.dart';

class NavigationWidget extends StatefulWidget {
  final List<NavigationSectionWidget> children;

  NavigationWidget({Key key, @required this.children}) : super(key: key);

  @override
  _NavigationWidgetState createState() => _NavigationWidgetState(children);
}

class _NavigationWidgetState extends State<NavigationWidget> {
  int _selectedIndex = 0;
  List<NavigationSectionWidget> _children;

  _NavigationWidgetState(List<NavigationSectionWidget> children) {
    _children = children;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> items =
        _children.map((e) => e.buildBottomNav()).toList();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(),
      ),
      body: Center(
        child: _children.elementAt(_selectedIndex).section,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class NavigationSectionWidget {
  final IconData icon;
  final String title;
  final Widget section;

  const NavigationSectionWidget({this.icon, this.title, this.section});

  BottomNavigationBarItem buildBottomNav() {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      title: Text(title),
    );
  }
}
