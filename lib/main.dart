import 'package:amazon/Constants/global_variable.dart';
import 'package:amazon/Provider/userprovider.dart';
import 'package:amazon/common/bottom_bar.dart';
import 'package:amazon/features/Accounts/Screens/account_screen.dart';
import 'package:amazon/features/Admin/Screens/admin_screens.dart';
import 'package:amazon/features/auth/Screens/auth_screen.dart';
import 'package:amazon/features/auth/Services/auth_services.dart';
import 'package:amazon/home/screens/home_screen.dart';
import 'package:amazon/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//we are going to use provider as a state management tool for that whole app
void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child: const MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context as BuildContext);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Amazon clone ",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Golobal_variable.backgroundColor,
          colorScheme: ColorScheme.light(
            primary: Golobal_variable.secondaryColor,
          ),
          appBarTheme: const AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(
                color: Colors.black,
              ))),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty ?  Provider.of<UserProvider>(context).user.type=='user'?AdminScreen():AdminScreen():AdminScreen(),
    );
  }
}
