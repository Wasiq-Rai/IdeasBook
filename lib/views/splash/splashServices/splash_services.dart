import 'dart:async';

import 'package:flutter/material.dart';
import 'package:madproject/utils/routes/route_names.dart';

class SplashServices{



  void isLogin(BuildContext context){
    Timer(
      Duration(
        seconds: 3
      ),
        () => Navigator.pushNamed(context,  RouteName.loginScreen)
    );
  }
}