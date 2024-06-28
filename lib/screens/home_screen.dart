import 'package:flutter/material.dart';
import 'package:simple_calculator/screens/calc_screen.dart';
import 'package:simple_calculator/screens/sign_in_screen.dart';
import 'package:simple_calculator/screens/sign_up_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Widget> _screens = [
    SignInScreen(),
    SignUpScreen(),
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
          color: Colors.blue, // Set the drawer background color
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  'Menu',
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                leading: Icon(Icons.login, color: Colors.white),
                title: Text('Sign In', style: TextStyle(color: Colors.white)),
                onTap: () => _onDrawerItemTapped(0),
              ),
              ListTile(
                leading: Icon(Icons.app_registration, color: Colors.white),
                title: Text('Sign Up', style: TextStyle(color: Colors.white)),
                onTap: () => _onDrawerItemTapped(1),
              ),
              ListTile(
                leading: Icon(Icons.calculate, color: Colors.white),
                title: Text('Calculator', style: TextStyle(color: Colors.white)),
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
            icon: Icon(Icons.login),
            label: 'Sign In',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.app_registration),
            label: 'Sign Up',
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
