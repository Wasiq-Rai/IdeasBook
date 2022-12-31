import 'dart:math';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:madproject/views/dashboard/dashboard_Screen.dart';
import 'package:madproject/views/profilepage/profile_screen.dart';
import 'package:madproject/views/splash/splash_screen.dart';

import '../../views/services/session_controller.dart';
import '../routes/route_names.dart';


const tabs= <String, IconData>{
  'trending' : Icons.trending_up,
  'home': Icons.home,
  'profile': Icons.person
};


class BottomBar extends StatefulWidget {
   Widget? _widget;

   BottomBar({Key? key}) : super(key: key);


  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  var index=1;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();





  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: SafeArea(
          child: Scaffold(
            key: _scaffoldKey,              bottomNavigationBar: ConvexAppBar.badge(const <int, dynamic>{3: '99+'},
                items: <TabItem>[
                  for (final entry in tabs.entries)
                    TabItem(icon: entry.value,title: entry.key)
                ],
                onTap: (int i){

                  if(i==0) {
                    setState(() {
                      index=i;
                      widget._widget = SplashScreen();
                    });


                    debugPrint("i: " + i.toString());
                  }
                  else if(i==1){
                  debugPrint("i: "+i.toString());
                  setState(() {
                    index=i;
                    widget._widget=DashboardScreen();
                  });

                  }
                  else
                  debugPrint("i: "+i.toString());{
                    setState(() {
                      index=i;
                      widget._widget=ProfileScreen();
                    });

                  }
                },),
              drawer: Drawer(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height/(4),
                      color: Colors.black,
                      child: Column(
                        children: [
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 200,
                          width: 100,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.blueGrey,
                                Colors.teal,
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(5, 5),
                                blurRadius: 10,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text('Menu'),
                          ),
                        ),

                        Column(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.green,
                                    Colors.blue,
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(5, 5),
                                    blurRadius: 10,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text('Home'),
                              ),
                            ),
                        SizedBox(
                          height: 20,
                        ),


                        Container(
                              height: 70,
                              width: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.orange,
                                    Colors.yellow,
                                  ],

                                ),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(5, 5),
                                    blurRadius: 10,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text('Trending'),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.pink,
                                Colors.purple,
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(5, 5),
                                blurRadius: 10,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text('Settings'),
                          ),
                        ),
                        SizedBox(
                          width: 1,
                        ),
                        Container(
                          height: 155,
                          width: 78,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.blue,
                                Colors.redAccent,
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(5, 5),
                                blurRadius: 10,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text('Connects'),
                          ),
                        ),
                      ],
                    ),

                    InkWell(

                      child: Container(
                        height: 100,  // Random height between 50 and 150
                        width: 250,  // Random width between 100 and 300
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.red,
                              Colors.pink,
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(5, 5),
                              blurRadius: 10,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text('Logout'),
                        ),
                      ),
                      onTap: () {
                      FirebaseAuth auth = FirebaseAuth.instance;
                      auth.signOut().then((value) {
                      SessionController().userId = ' ';
                      Navigator.pushNamed(context, RouteName.loginScreen);
                      });}

                    ),
                  ],
                ),
              ),

              body:(index==0)?SplashScreen():(index==1)?DashboardScreen():ProfileScreen() ,
            appBar: AppBar(
              backgroundColor: Colors.purpleAccent,
              // LinearGradient(
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              //   colors: [Colors.deepPurple, Colors.purpleAccent,
              // ),
              leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
              ),
              centerTitle: true,
              title: Text(
                  SessionController().userId.toString(),
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // Open the search screen
                  },
                ),
              ],
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
            ),



          )),


          );
  }
}

