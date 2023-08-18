import 'package:amazon/features/Accounts/Screens/account_screen.dart';
import 'package:amazon/home/screens/home_screen.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:amazon/Constants/global_variable.dart';
import 'package:badges/badges.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const Center(child: Text('Cart Screen'),),
    
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          //home
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(
                  color: _page == 0
                      ? Golobal_variable.selectedNavBarColor
                      : Golobal_variable.backgroundColor,
                  width: bottomBarBorderWidth,
                ),
              )),
              child: const Icon(
                Icons.home_outlined,
              ),
            ),
            label: "",
          ),

          //account
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(
                  color: _page == 1
                      ? Golobal_variable.selectedNavBarColor
                      : Golobal_variable.backgroundColor,
                  width: bottomBarBorderWidth,
                ),
              )),
              child: Icon(
                Icons.person_outlined,
              ),
            ),
            label: "",
          ),

//cart
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(
                  color: _page == 2
                      ? Golobal_variable.selectedNavBarColor
                      : Golobal_variable.backgroundColor,
                  width: bottomBarBorderWidth,
                ),
              )),
              child: Badge(
                elevation: 0,
                badgeColor: Colors.white,
                badgeContent: const Text('2'),
                child: Icon(
                  Icons.shopping_cart_outlined,
                ),
              ),
            ),
            label: "",
          )
        ],
        currentIndex: _page,
        selectedItemColor: Golobal_variable.selectedNavBarColor,
        unselectedItemColor: Golobal_variable.unselectedNavBarColor,
        backgroundColor: Golobal_variable.backgroundColor,
        iconSize: 28,
        onTap: (value) {
          updatePage(value);
        },
      ),
    );
  }
}
