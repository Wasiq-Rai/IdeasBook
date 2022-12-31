

import 'package:flutter/material.dart';
import 'package:madproject/utils/routes/route_names.dart';
import 'package:madproject/views/signup/signupcontroller.dart';
import 'package:provider/provider.dart';

import '../../utils/components/TextFormField.dart';



class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _pinned = true;
  final _formKey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final githubcontroller = TextEditingController();
  final mobilecontroller = TextEditingController();
  final emailfocusnode = FocusNode();
  final namefocusnode = FocusNode();
  final githubfocusnode = FocusNode();
  final mobilefocusnode = FocusNode();
  final passwordfocusnode = FocusNode();

  String _name="";
  String _email="";
  String _github="";
  String _mobileNumber="";
  String _password="";
  VoidCallbackAction onPress = new VoidCallbackAction();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
      emailcontroller.dispose()  ;
      passwordcontroller.dispose()  ;
      namecontroller.dispose()  ;
      githubcontroller.dispose()  ;
      mobilecontroller.dispose()  ;
      emailfocusnode.dispose()  ;
      namefocusnode.dispose()  ;
      githubfocusnode.dispose()  ;
      mobilefocusnode.dispose()  ;
      passwordfocusnode.dispose()  ;
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
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                  elevation: MaterialStateProperty.all(8.0),
                ),
                onPressed: () {
                      Navigator.pop(context);

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
            child: ChangeNotifierProvider(
              create: (_)=>SignupController(),
              child: Consumer<SignupController>(
                builder: (context,provider,child){
                  bool loading =false;
                  return Container(
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
                                  Text_FormField(
                                    controller: namecontroller,
                                    focusnode: namefocusnode,
                                    labeltext: "Name",
                                    value: _name,
                                    obscure: false,
                                    current: namefocusnode,
                                    nextFocus: emailfocusnode,
                                  ),
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
                                    current: passwordfocusnode,
                                    nextFocus: githubfocusnode,
                                  ),
                                  Text_FormField(
                                    controller: githubcontroller,
                                    focusnode: githubfocusnode,
                                    labeltext: "Github Account",
                                    value: _github,
                                    obscure: false,
                                    keyboardtype: TextInputType.url,
                                    current: githubfocusnode,
                                    nextFocus: mobilefocusnode,
                                  ),
                                  Text_FormField(
                                    controller: mobilecontroller,
                                    focusnode: mobilefocusnode,
                                    labeltext: "Mobile Number",
                                    value: _mobileNumber,
                                    obscure: false,
                                    keyboardtype: TextInputType.phone,
                                  ),

                                  Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                                      child:
                                      InkWell(
                                        borderRadius: BorderRadius.circular(10.0),
                                        onTap: () {
                                          setState(() {
                                            provider.loading?null:onPress;
                                          });

                                          if (_formKey.currentState!.validate()) {

                                            _formKey.currentState!.save();
                                            provider.signup(context,namecontroller.text, emailcontroller.text,
                                                passwordcontroller.text, githubcontroller.text, mobilecontroller.text);
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
                                          child:  Center(
                                            child: provider.loading?Center(child: CircularProgressIndicator()): Text(
                                              'Create Account',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
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
                  );
                },

              ),
            )




        ),
      ]),
    );
  }
}