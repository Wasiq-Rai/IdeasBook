import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (context, snapshot){
          return ListTile(
            leading: CircleAvatar(

              child: Image.asset('assets/images/logo.jpg'),
            ),
            title: Text(
              'Omar liked your project',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              DateTime.now().toString(),
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            tileColor: Colors.white,
            selectedTileColor: Colors.grey,
          );
        });

  }
}
