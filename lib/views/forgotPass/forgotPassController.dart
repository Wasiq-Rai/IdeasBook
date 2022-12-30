import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:madproject/utils/routes/route_names.dart';
import 'package:madproject/utils/utils/utils.dart';
import 'package:madproject/views/services/session_controller.dart';

class ForgotPasswordController with ChangeNotifier{
  bool _loading =false;
  bool get loading => _loading;

  FirebaseAuth auth = FirebaseAuth.instance;
  void setLoading(bool value){
    _loading = value;
    notifyListeners();
  }
  void forgotPass(BuildContext context, String email){
    setLoading(true);
    try{
      auth.sendPasswordResetEmail(email: email)
          .then((value) {
        setLoading(false);
        Navigator.pushNamed(context, RouteName.loginScreen);
        Utils.toastMessage("Please check your email to recover the password.\n If it is not there, check the spam");
      })
          .catchError((e)=>Utils.toastMessage(e.toString()));
    }catch(e){
      setLoading(false);
      Utils.toastMessage(e.toString());

    }
  }

}