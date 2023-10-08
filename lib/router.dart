import 'package:amazon/Models/product.dart';
import 'package:amazon/common/bottom_bar.dart';
import 'package:amazon/features/Admin/Screens/add_product_screen.dart';
import 'package:amazon/features/Product_details/screens/product_details.dart';
import 'package:amazon/features/auth/Screens/auth_screen.dart';
import 'package:amazon/home/Search/screens/search_screen.dart';
import 'package:amazon/home/screens/catagory_deals_screen.dart';
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

    case CategoryDealsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => CategoryDealsScreen(
                category: category,
              ));

    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => SearchScreen(
                searchQuery: searchQuery,
              ));

    case ProductDetailScreen.routeName:
      var product = routeSettings.arguments as Product;

      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => ProductDetailScreen(product: product));

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
