

import 'package:flutter/material.dart';
import 'package:madproject/utils/routes/routes.dart';
import 'package:madproject/views/login/login.dart';



class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _pinned = true;
  final _formKey = GlobalKey<FormState>();
  String _name="";
  String _email="";
  String _github="";
  String _mobileNumber="";
  String _password="";
  VoidCallbackAction onPress = new VoidCallbackAction();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5aa596).withOpacity(.8),
      body: CustomScrollView(slivers: [
        SliverAppBar(

          floating: false,
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white24),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                  elevation: MaterialStateProperty.all(8.0),
                ),
                onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => LoginScreen()));
    },

                child: Text("Sign In",style: TextStyle(
                    color: Colors.white
                ),),
              ),
            ),
          ],
          automaticallyImplyLeading: true,
          centerTitle: true,
          pinned: this._pinned,
          expandedHeight: MediaQuery.of(context).size.height * 0.2,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              "IDEAS BOOK",
              textAlign: TextAlign.start,

              style: TextStyle(

                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(color: Colors.black)]),
            ),
            background: Image.asset(
              'assets/images/purple.jpeg',
              fit: BoxFit.fill,
            ),
          ),
        ),
        SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: false,
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.blueGrey
                ),
                height: MediaQuery.of(context).size.height * 0.8,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0,10.0,20.0,10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(60),bottomLeft: Radius.circular(100)),
                        color: Colors.white
                    ),
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Name',
                                labelStyle: TextStyle(fontSize: 16.0, fontFamily: 'DancingScript'),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                                ),
                                prefixIcon: Icon(Icons.person),
                                suffixIcon: Icon(Icons.check_circle, color: Colors.green),
                                hintStyle: TextStyle(fontSize: 14.0, color: Colors.grey),
                                errorStyle: TextStyle(fontSize: 14.0, color: Colors.red),
                              ),
                              cursorColor: Colors.purple,

                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                              onSaved: (value) => _name = value!,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(fontSize: 16.0, fontFamily: 'DancingScript'),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                                ),
                                prefixIcon: Icon(Icons.person),
                                suffixIcon: Icon(Icons.check_circle, color: Colors.green),
                                hintStyle: TextStyle(fontSize: 14.0, color: Colors.grey),
                                errorStyle: TextStyle(fontSize: 14.0, color: Colors.red),
                              ),
                              cursorColor: Colors.purple,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                              onSaved: (value) => _email = value!,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'GitHub Account',
                                labelStyle: TextStyle(fontSize: 16.0, fontFamily: 'DancingScript'),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                                ),
                                prefixIcon: Icon(Icons.person),
                                suffixIcon: Icon(Icons.check_circle, color: Colors.green),
                                hintStyle: TextStyle(fontSize: 14.0, color: Colors.grey),
                                errorStyle: TextStyle(fontSize: 14.0, color: Colors.red),
                              ),
                              cursorColor: Colors.purple,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your GitHub account';
                                }
                                return null;
                              },
                              onSaved: (value) => _github = value!,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Mobile Number',
                                labelStyle: TextStyle(fontSize: 16.0, fontFamily: 'DancingScript'),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                                ),
                                prefixIcon: Icon(Icons.person),
                                suffixIcon: Icon(Icons.check_circle, color: Colors.green),
                                hintStyle: TextStyle(fontSize: 14.0, color: Colors.grey),
                                errorStyle: TextStyle(fontSize: 14.0, color: Colors.red),
                              ),
                              cursorColor: Colors.purple,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your mobile number';
                                }
                                return null;
                              },
                              onSaved: (value) => _mobileNumber = value!,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(fontSize: 16.0, fontFamily: 'DancingScript'),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                                ),
                                prefixIcon: Icon(Icons.person),
                                suffixIcon: Icon(Icons.check_circle, color: Colors.green),
                                hintStyle: TextStyle(fontSize: 14.0, color: Colors.grey),
                                errorStyle: TextStyle(fontSize: 14.0, color: Colors.red),
                              ),
                              cursorColor: Colors.purple,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                              onSaved: (value) => _password = value!,
                              obscureText: true,
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                child:
                                InkWell(
                                  borderRadius: BorderRadius.circular(10.0),
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      // Perform login here
                                    }
                                  },
                                  child: Container(
                                    height: 50.0,
                                    width: 160.0,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0, 5),
                                          blurRadius: 5.0,
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Create Account',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
            )




        ),
      ]),
    );
  }
}