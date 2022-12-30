import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:madproject/utils/routes/route_names.dart';
import 'package:madproject/utils/utils/utils.dart';
import 'package:madproject/views/services/session_controller.dart';

class SignupController with ChangeNotifier{
bool _loading =false;
bool get loading => _loading;

FirebaseAuth auth = FirebaseAuth.instance;
DatabaseReference ref = FirebaseDatabase.instance.ref().child("Users");

 void setLoading(bool value){
  _loading = value;
  notifyListeners();
}
void signup(BuildContext context,String name, String email, String password, String github, String mobile){
setLoading(true);
try{
  auth.createUserWithEmailAndPassword(email: email, password: password)
      .then((value) {
        setLoading(false);
        SessionController().userId= value.user!.uid.toString();
        ref.child(value.user!.uid.toString()).set({
          "id": value.user!.uid.toString(),
          "email": value.user!.email.toString(),
          "password": password,
          "github": github,
          "mobile": mobile,
          "profilePic": "",
          "birthday": ""


        }).then((value){
          setLoading(false);
          Navigator.pushNamed(context, RouteName.dashboardScreen);
        }).onError((error, stackTrace){
          setLoading(false);
          Utils.toastMessage(error.toString());
        });
        Utils.toastMessage("Account created Sucessfully!");})
      .catchError((e)=>Utils.toastMessage(e.toString()));
}catch(e){
  setLoading(false);
  Utils.toastMessage(e.toString());

}
}

}