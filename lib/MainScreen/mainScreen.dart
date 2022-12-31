import 'package:flutter/cupertino.dart';
import 'package:madproject/views/dashboard/dashboard_Screen.dart';
import 'package:madproject/views/profilepage/profile_screen.dart';
import 'package:madproject/views/splash/splash_screen.dart';

import '../utils/components/BottomBar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    debugPrint(BottomBar.screen_no.toString());
    return FutureBuilder(
    future: BottomBar.screen(),
      builder: (context,snapshot){
        //return BottomBar(widget: BottomBar.screen_no==0?SplashScreen():BottomBar.screen_no==1?DashboardScreen():ProfileScreen());
        return _getScreenWidget();
  },);
  }
}
Widget _getScreenWidget() {
  switch (BottomBar.screen_no) {
    case 0:
      return SplashScreen();
    case 1:
      return DashboardScreen();
    case 2:
      return ProfileScreen();
    default:
      return DashboardScreen();
  }
}

