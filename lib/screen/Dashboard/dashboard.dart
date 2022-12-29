
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:ubwiru/helper/colors/constcolor.dart';
import 'package:ubwiru/screen/Signup/presentation/signup.dart';
import 'package:ubwiru/screen/homepage/presentation/homepage_screen.dart';
import 'package:ubwiru/screen/sign_in/presentation/signin.dart';




class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenPage createState() => _DashboardScreenPage();
}

class _DashboardScreenPage extends State<DashboardScreen>{
 int selectedPos = 2;

  double bottomNavBarHeight = 60;

  List<TabItem> tabItems = List.of([
    TabItem(
      Icons.notifications,
      "",
      buttoncolor,
      labelStyle: TextStyle(
        fontWeight: FontWeight.normal,
      ),
    ),
    TabItem(
      Icons.favorite,
      "",
      buttoncolor,
      labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    TabItem(
      Icons.home,
      "",
      buttoncolor,
      // circleStrokeColor: Colors.black,
    ),
    TabItem(
      Icons.chat,
      "",
      buttoncolor,
    ),
     TabItem(
      Icons.menu,
      "",
      buttoncolor,
    ),
  ]);

  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            child: bodyContainer(),
            padding: EdgeInsets.only(bottom: bottomNavBarHeight),
          ),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  Widget bodyContainer() {
    Color? selectedColor = tabItems[selectedPos].circleColor;
    String slogan;
    var a;
    switch (selectedPos) {
      case 0:
      a  = SignupPage();
        break;
      case 1:
       a = SignInPage();
        break;
      case 2:
        a = HomePageScreen();
        break;
      case 3:
        slogan = "Noise, Panic, Ignore";
        break;
      default:
        slogan = "";
        break;
    }

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: a
    );
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      selectedPos: selectedPos,
      barHeight: bottomNavBarHeight,
      // use either barBackgroundColor or barBackgroundGradient to have a gradient on bar background
      barBackgroundColor: Colors.white,
      // barBackgroundGradient: LinearGradient(
      //   begin: Alignment.bottomCenter,
      //   end: Alignment.topCenter,
      //   colors: [
      //     Colors.blue,
      //     Colors.red,
      //   ],
      // ),
      backgroundBoxShadow: <BoxShadow>[
        BoxShadow(color: Colors.black45, blurRadius: 10.0),
      ],
      animationDuration: Duration(milliseconds: 300),
      selectedCallback: (int? selectedPos) {
        setState(() {
          this.selectedPos = selectedPos ?? 0;
          print(_navigationController.value);
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}
