import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:madproject/utils/routes/route_names.dart';
import 'package:madproject/utils/utils/utils.dart';
import 'package:madproject/views/services/session_controller.dart';

class LoginController with ChangeNotifier{
bool _loading =false;
bool get loading => _loading;

FirebaseAuth auth = FirebaseAuth.instance;
 void setLoading(bool value){
  _loading = value;
  notifyListeners();
}
void login(BuildContext context, String email, String password){
setLoading(true);
try{
  auth.signInWithEmailAndPassword(email: email, password: password)
      .then((value) {
        SessionController().userId = value.user!.uid.toString();
    setLoading(false);
    Navigator.pushNamed(context, RouteName.dashboardScreen);
      })
      .catchError((e)=>Utils.toastMessage(e.toString()));
}catch(e){
  setLoading(false);
  Utils.toastMessage(e.toString());

}
}

}