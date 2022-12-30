import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import '../../utils/routes/route_names.dart';
import '../services/session_controller.dart';

const tabs= <String, IconData>{
  'trending' : Icons.trending_up,
  'home': Icons.home,
  'profile': Icons.person
};


class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TabStyle _tabStyle = TabStyle.reactCircle;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: SafeArea(
          child: Scaffold(
            key: _scaffoldKey,
              body: Column(
                children: [
                  Container(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            _scaffoldKey.currentState!.openDrawer();
                          },
                        ),
                        Text(SessionController().userId.toString()),
                        IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          height: 200,
                          child: Center(
                            child: Text('News Feed'),
                          ),
                        ),
                        Container(
                          height: 50,
                          child: Center(
                            child: Text('Groups'),
                          ),
                        ),
                        Container(
                          height: 50,
                          child: Center(
                            child: Text('Friends'),
                          ),
                        ),
                        Container(
                          height: 50,
                          child: Center(
                            child: Text('Pages'),
                          ),
                        ),
                      ],
                    ),
                  ),

              ]
              ),
              bottomNavigationBar: ConvexAppBar.badge(const <int, dynamic>{3: '99+'},
                items: <TabItem>[
                  for (final entry in tabs.entries)
                    TabItem(icon: entry.value,title: entry.key)
                ],
              onTap: (int i){
                debugPrint("Clicked $i");
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
