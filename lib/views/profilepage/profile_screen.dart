import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:madproject/utils/components/OpenImage.dart';
import 'package:madproject/views/profilepage/profileController.dart';
import 'package:provider/provider.dart';

import '../../utils/components/BottomBar.dart';
import '../services/session_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    final ref = FirebaseDatabase.instance.ref('Users');
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
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              // Cover picture with gradient
                              Container(
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height / 3,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.deepPurple,
                                      Colors.purpleAccent,
                                    ],
                                  ),
                                ),
                              ),
                              // Display picture with circular clip path
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                    alignment: Alignment.bottomRight,
                                    children:[ Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          color: Colors.purpleAccent,
                                          border: Border.all(
                                            color: Colors.purple,
                                            width: 3,
                                            style: BorderStyle.solid,

                                          ),
                                          shape: BoxShape.circle
                                      ),
                                      child: ClipOval(

                                          child: provider.image==null?map['profilePic']==""?Icon(Icons.person,size: 65,):Image.network(
                                            map['profilePic'].toString()):InkWell(
                                            onTap: ()=>OpenImage("profile_picture", "provider.image!.path"),
                                            child: Hero(
                                              tag: 'profile_picture',
                                              child: Image.file(File(provider.image!.path).absolute),
                                              ),
                                          ),
                                          ),
                                      ),
                                    
                                      InkWell(
                                        onTap: (){
                                          provider.pickImage(context);
                                        },
                                        child: CircleAvatar(
                                          child: Icon(Icons.add_a_photo),
                                        ),
                                      )
                                    ]),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ListTile(
                            title: Text(map['name'],style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                          ListTile(
                            leading: Icon(Icons.code),
                            title: Text("Github:"),
                            trailing: Text(map['github']),
                          )
                        ],
                      ),
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

