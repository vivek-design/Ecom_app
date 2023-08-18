import 'package:amazon/features/Admin/Screens/posts_screen.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import '../../../Constants/global_variable.dart';
class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
   int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
       PostsScreen(),

    const Center(child: Text('Analytics Page'),),
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
     appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          //we do not have gradient feature in appbar 
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: Golobal_variable.appBarGradient,
            ),
          ),

          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
           
            Container(
              alignment: Alignment.topLeft,
              child:Image.asset('assets/Images/amazon_in.png',
              width: 120,
              height: 45,
              color:Colors.black)
            ),

            const Text('Admin',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)

           
          ]),
        ),
      ),
       bottomNavigationBar: BottomNavigationBar(
        items: [
          //Posts
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

          //Analytics
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
                Icons.analytics_outlined,
              ),
            ),
            label: "",
          ),

//Orders

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
              child: Icon(
                Icons.all_inbox_outlined,
              ),
            ),
            label: "",
          ),
         
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
      body: pages[_page],
    ) ;
  }
}

