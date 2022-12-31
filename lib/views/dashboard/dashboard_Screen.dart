import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import '../../utils/components/BottomBar.dart';
import '../../utils/routes/route_names.dart';
import '../profilepage/profile_screen.dart';
import '../profilepage/profile_screen.dart';
import '../services/session_controller.dart';



class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TabStyle _tabStyle = TabStyle.reactCircle;
  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [

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
    );

  }
}
