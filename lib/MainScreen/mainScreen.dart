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
        return BottomBar();
  }
}

