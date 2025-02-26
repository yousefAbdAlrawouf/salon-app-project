import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salon_app/core/constants/app_colors.dart';
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
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w700,color: Color.fromRGBO(179, 179, 179, 1)),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700,color: AppColors.primarycolor),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: AppColors.primarycolor,
        unselectedItemColor: Color.fromRGBO(179, 179, 179, 1),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        AppColors.primarycolor, BlendMode.srcIn),
                    child: SvgPicture.asset("assets/icons/home.svg"),
                  )
                : SvgPicture.asset("assets/icons/home.svg"),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        AppColors.primarycolor, BlendMode.srcIn),
                    child: SvgPicture.asset("assets/icons/booking.svg"),
                  )
                : SvgPicture.asset("assets/icons/booking.svg"),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        AppColors.primarycolor, BlendMode.srcIn),
                    child: SvgPicture.asset("assets/icons/add.svg"),
                  )
                : SvgPicture.asset("assets/icons/add.svg"),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        AppColors.primarycolor, BlendMode.srcIn),
                    child: SvgPicture.asset("assets/icons/order.svg"),
                  )
                : SvgPicture.asset("assets/icons/order.svg"),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 4
                ? ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        AppColors.primarycolor, BlendMode.srcIn),
                    child: SvgPicture.asset("assets/icons/profile.svg"),
                  )
                : SvgPicture.asset("assets/icons/profile.svg"),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}


// colorFilter: ColorFilter.mode(AppColors.primarycolor, BlendMode.srcIn),












