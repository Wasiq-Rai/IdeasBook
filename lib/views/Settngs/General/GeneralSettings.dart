import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../profilepage/profileController.dart';
import '../../services/session_controller.dart';

class GeneralSettingsScreen extends StatelessWidget {
  final ref = FirebaseDatabase.instance.ref('Users');
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>ProfileController(),
      child:Consumer <ProfileController>(
        builder: (context,provider,child){
          return StreamBuilder(
            stream: ref.child(SessionController().userId.toString()).onValue,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(!snapshot.hasData){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }else if(snapshot.hasData){
                Map<dynamic,dynamic> map = snapshot.data.snapshot.value;
                return Scaffold(
                  appBar: AppBar(
                    title: Text('General Settings'),
                  ),
                  body: ListView(
                    children: [
                      ListTile(
                        title: Text('Change username'),
                        onTap: () {
                          provider.showUserNameDialogueAlert(context,map['name']);
                        },
                      ),
                      ListTile(
                        title: Text('Change phone number'),
                        onTap: () {
                          // Change the phone number
                          provider.showMobileNumberDialogueAlert(context,map['mobile']);
                        },
                      ),
                      ListTile(
                        title: Text('Add birthday'),
                        onTap: () {
                          // Add a birthday

                          provider.pickerForBirthday(context, map['birthday']);
                        },
                      ),
                    ],
                  ),
                );
              }else{
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },);

        },
      ),


    );




  }
}