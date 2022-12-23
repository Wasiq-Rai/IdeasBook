import 'package:flutter/material.dart';
import 'package:madproject/utils/routes/routes.dart';
import 'package:madproject/views/signup/signup.dart';

import '../../utils/components/TextFormField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _pinned = true;
  final _formKey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final emailfocusnode = FocusNode();
  final passwordfocusnode = FocusNode();
  String _name = "";
  String _email = "";
  String _github = "";
  String _mobileNumber = "";
  String _password = "";
  VoidCallbackAction onPress = new VoidCallbackAction();
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    emailfocusnode.dispose();
    passwordfocusnode.dispose();
  }
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
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))),
                  elevation: MaterialStateProperty.all(8.0),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignupScreen()));
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
          automaticallyImplyLeading: true,
          centerTitle: true,
          pinned: this._pinned,
          expandedHeight: MediaQuery.of(context).size.height * 0.3,
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
                decoration: BoxDecoration(color: Colors.blueGrey),
                height: MediaQuery.of(context).size.height * 0.6,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  child: Container(
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(60),
                            bottomLeft: Radius.circular(100)),
                        color: Colors.white),
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text_FormField(
                              controller: emailcontroller,
                              focusnode: emailfocusnode,
                              labeltext: "Email",
                              value: _email,
                              obscure: false,
                              keyboardtype: TextInputType.emailAddress,
                              current: emailfocusnode,
                              nextFocus: passwordfocusnode,
                            ),
                            Text_FormField(
                              controller: passwordcontroller,
                              focusnode: passwordfocusnode,
                              labeltext: "Password",
                              value: _password,
                              obscure: true,
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: InkWell(
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
                                        'Login',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                            Divider(
                              thickness: 2.0,
                            ),
                            TextButton(
                                onPressed: () => {},
                                child: Center(child: Text("Forgot Password?")))
                          ],
                        ),
                      ),
                    ),
                  ),
                ))),
      ]),
    );
  }
}
