import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../views/services/session_controller.dart';
import '../routes/route_names.dart';


const tabs= <String, IconData>{
  'trending' : Icons.trending_up,
  'home': Icons.home,
  'profile': Icons.person
};


class BottomBar extends StatefulWidget {
  final Widget widget;
  static int screen_no =1;

  const BottomBar({Key? key, required this.widget}) : super(key: key);
  static Future screen ()async{
    return await BottomBar.screen_no;

  }

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {



  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: SafeArea(
          child: Scaffold(
            key: _scaffoldKey,
            body: widget.widget,
              bottomNavigationBar: ConvexAppBar.badge(const <int, dynamic>{3: '99+'},
                items: <TabItem>[
                  for (final entry in tabs.entries)
                    TabItem(icon: entry.value,title: entry.key)
                ],
                onTap: (int i){
                setState(() {
                  BottomBar.screen_no=i;
                });
                  // if(i==0)
                  //   Navigator.pushNamed(context, RouteName.splashScreen);
                  // else if(i==1)
                  //   Navigator.pushNamed(context, RouteName.dashboardScreen);
                  // else
                  //   Navigator.pushNamed(context, RouteName.profileScreen);
                },),
              drawer: Drawer(
                  child: ListView(children: [
                    DrawerHeader(
                      child: Text('Menu'),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text('Home'),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Settings'),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Logout'),
                      onTap: () {
                        FirebaseAuth auth = FirebaseAuth.instance;
                        auth.signOut().then((value) {
                          SessionController().userId = ' ';
                          Navigator.pushNamed(context, RouteName.loginScreen);
                        });

                      },
                    )
                  ])))),

          );
  }
}
