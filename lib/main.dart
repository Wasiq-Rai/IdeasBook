import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:madproject/utils/routes/route_names.dart';
import 'package:madproject/utils/routes/routes.dart';
import 'package:madproject/views/splash/splash_screen.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MAD PROJECT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      initialRoute: RouteName.splashScreen,

      onGenerateRoute: Routes.generateRoute,
    );
  }
}
