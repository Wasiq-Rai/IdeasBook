import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:madproject/res/fonts.dart';
import 'package:madproject/views/services/splash_services.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../res/color.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  with RouteAware{
  final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
  SplashServices splashServices = new SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.isLogin(context,routeObserver);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('first_time', true);
    });
    super.didPopNext();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const  [
              Image(image: AssetImage('assets/images/logo.jpg')),
              const Padding(
                padding:  EdgeInsets.symmetric(vertical: 20),
                child: Center(child: Text('Wasiq Rai ', style: TextStyle(fontFamily: AppFonts.sfProDisplayBold , fontSize: 40, fontWeight: FontWeight.w700),)),
              )
    ],
          )
      ),
    );
  }
}