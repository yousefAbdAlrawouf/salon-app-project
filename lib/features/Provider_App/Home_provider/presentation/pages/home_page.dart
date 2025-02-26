import 'package:flutter/material.dart';
import 'package:salon_app/features/Provider_App/Home_provider/presentation/pages/BookingContent.dart';
import 'package:salon_app/features/Provider_App/Home_provider/presentation/pages/Home_content.dart';
import 'package:salon_app/features/Provider_App/Home_provider/presentation/pages/Profile_content.dart';
import 'package:salon_app/features/Provider_App/Home_provider/presentation/pages/order_content.dart';

import 'package:salon_app/features/products_and_services/presentation/pages/ShowProductsAndServices.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeContent(), 
    BookingsContent(), 
    Showproductsandservices(),
    OrdersContent(), 
    ProfileContent(), 
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex], 
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Color.fromRGBO(166, 77, 121, 1),
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}















