import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:madproject/views/services/session_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/routes/route_names.dart';

class RouteAwareWidget implements RouteAware {
  @override
  void didPopNext() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('first_time', true);
    });
  }

  @override
  void didPop() {
    // TODO: implement didPop
  }

  @override
  void didPush() {
    // TODO: implement didPush
  }

  @override
  void didPushNext() {
    // TODO: implement didPushNext
  }
}

class SplashServices {
  Future<void> isLogin(BuildContext context, RouteObserver<dynamic> routeObserver) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    // Check if this is the first time the app is being opened
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firstTime = prefs.getBool('first_time') ?? true;

    if (user != null) {
      SessionController().userId =user.uid.toString();
      Timer(
          Duration(seconds: 3),
              () => Navigator.pushNamed(context, RouteName.mainScreen));
    } else {
      Timer(
          Duration(seconds: 3),
              () => Navigator.pushNamed(context, RouteName.loginScreen));
    }

    // Update the flag in shared preferences if this is the first time the app is being opened
    if (firstTime) {
      prefs.setBool('first_time', false);
    }

    // Register the routeObserver as a route observer
    routeObserver.subscribe(RouteAwareWidget(), ModalRoute.of<dynamic>(context));
  }
}
