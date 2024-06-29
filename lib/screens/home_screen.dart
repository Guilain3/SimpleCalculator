import 'package:flutter/material.dart';
import 'calc_screen.dart';
import 'sign_in_screen.dart';
import 'sign_up_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    SignUpScreen(),
    SignInScreen(),
    CalcScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onDrawerItemTapped(int index) {
    Navigator.pop(context); // Close the drawer
    _onItemTapped(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'App Menu',
          style: TextStyle(color: Colors.white), // Set the title color to white
        ),
        backgroundColor: Colors.blue, // Optional: Change the AppBar background color to blue
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white, // Set the drawer background color to white
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  'Menu',
                  style: TextStyle(color: Colors.blue),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
              ListTile(
                leading: Icon(Icons.person_add, color: _selectedIndex == 0 ? Colors.blue : Colors.black),
                title: Text(
                  'Sign Up',
                  style: TextStyle(color: _selectedIndex == 0 ? Colors.blue : Colors.black),
                ),
                onTap: () => _onDrawerItemTapped(0),
              ),
              ListTile(
                leading: Icon(Icons.person, color: _selectedIndex == 1 ? Colors.blue : Colors.black),
                title: Text(
                  'Sign In',
                  style: TextStyle(color: _selectedIndex == 1 ? Colors.blue : Colors.black),
                ),
                onTap: () => _onDrawerItemTapped(1),
              ),
              ListTile(
                leading: Icon(Icons.calculate, color: _selectedIndex == 2 ? Colors.blue : Colors.black),
                title: Text(
                  'Calculator',
                  style: TextStyle(color: _selectedIndex == 2 ? Colors.blue : Colors.black),
                ),
                onTap: () => _onDrawerItemTapped(2),
              ),
            ],
          ),
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add),
            label: 'Sign Up',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Sign In',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculator',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
