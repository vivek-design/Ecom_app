import 'package:amazon/common/bottom_bar.dart';
import 'package:amazon/features/Admin/Screens/add_product_screen.dart';
import 'package:amazon/features/auth/Screens/auth_screen.dart';
import 'package:amazon/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
      
   case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );


        case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );


      
        case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProductScreen(),
      );



    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (context) => Scaffold(
          body: Center(
            child: Text("No screen found"),
          ),
        ),
      );
  }
}
