import 'package:flutter/material.dart';
import 'package:madproject/utils/routes/routes.dart';
import 'package:madproject/views/signup/signup.dart';
import 'package:provider/provider.dart';

import '../../utils/components/TextFormField.dart';
import 'forgotPassController.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>  with ChangeNotifier{
  bool _pinned =true;
  final _formKey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final emailfocusnode = FocusNode();

  VoidCallbackAction onPress = new VoidCallbackAction();

  var _email;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();

    emailfocusnode.dispose();

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
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                color: Color(0xFF673AB7),
                                width: 3,
                                style: BorderStyle.solid,
                              ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Text("Enter your correct Email.\n In your Emails, check in Spam Folder to get the link of recovery.\nEnter your new Password there and get back to login with new Password",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.center,),
                              ),
                            ),
                            Text_FormField(
                              controller: emailcontroller,
                              focusnode: emailfocusnode,
                              labeltext: "Email",
                              value: _email,
                              obscure: false,
                              keyboardtype: TextInputType.emailAddress,
                              current: emailfocusnode,
                            ),
                            ChangeNotifierProvider(
                              create: (_)=>ForgotPasswordController(),
                              child: Consumer<ForgotPasswordController>(
                                builder: (context,provider,child){
                                  return Padding(
                                      padding:
                                      const EdgeInsets.symmetric(vertical: 16.0),
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(10.0),
                                        onTap: () {
                                          if (_formKey.currentState!.validate()) {
                                            _formKey.currentState!.save();
                                            provider.forgotPass(context, emailcontroller.text);
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
                                              'Recover',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ));
                                },
                              ),
                            ),
                            Divider(
                              thickness: 2.0,
                            ),

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
