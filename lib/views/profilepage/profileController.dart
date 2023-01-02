import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:madproject/utils/utils/utils.dart';
import 'package:madproject/res/color.dart' as color;
import '../../utils/components/TextFormField.dart';
import '../services/session_controller.dart';
class ProfileController with ChangeNotifier{
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('Users');
  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  final picker = ImagePicker();
  bool _loading =false;

   final namecontroller=TextEditingController();
   final birthdaycontroller = TextEditingController();
   final birthdayfocusnode= FocusNode();
   final namefocusnode  = FocusNode();
   final mobileNumbercontroller=TextEditingController();
   final mobileNumberfocusnode  = FocusNode();
  bool get loading => _loading;

  void setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  XFile? _image ;
  XFile? get image => _image;

  Future pickImageFromGallery(BuildContext context)async{
    final pickedImage = await picker.pickImage(source: ImageSource.gallery,imageQuality: 100);
    if(pickedImage!=null){
      _image=XFile(pickedImage.path);
      uploadImage();
      notifyListeners();
    }
  }
  Future pickImageFromCamera(BuildContext context)async{
    final pickedImage = await picker.pickImage(source: ImageSource.camera,imageQuality: 100);
    if(pickedImage!=null){
      _image=XFile(pickedImage.path);
      uploadImage();
      notifyListeners();
    }

  }
  void uploadImage()async{
    setLoading(true);
    firebase_storage.Reference storageRef = firebase_storage.FirebaseStorage.instance.ref("ProfileImage:"+SessionController().userId.toString());
    firebase_storage.UploadTask uploadTask = storageRef.putFile(File(image!.path).absolute);

    await Future.value(uploadTask);
    final newURL = await storageRef.getDownloadURL();

    ref.child(SessionController().userId.toString()).update({
      'profilePic': newURL.toString()
    }).then((value){setLoading(false);
      Utils.toastMessage("Profile Picture Updated");
    
    })

    .onError((error, stackTrace){
      setLoading(false);
      Utils.toastMessage(error.toString());
    });
  }
  void pickerForBirthday(context,birthday){
    showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2025))
        .then((DateTime? value) {
      if (value!=null){
        DateTime _fromDate= DateTime.now();
        _fromDate= value;
        final String date = DateFormat.yMMMd().format(_fromDate);
        //flutter pub add int1/intl
        ref.child(SessionController().userId.toString()).update({
          'birthday': date.toString()
        }).then((value){
          Utils.toastMessage("Birthday Updated");            });
      }

    });
  }

  void pickImage(context){
    showDialog(context: context,
        builder: (BuildContext contect){
          return AlertDialog(
            title: Text('Select a photo source'),
            content: Container(
              height: 130,
              child: Column(
                children: [
                  ListTile(
                    onTap: (){
                      pickImageFromCamera(context);
                      Navigator.pop(context);
                    },
                    leading: Icon(Icons.camera),
                    title: Text("Camera"),
                  ),
                  ListTile(
                    onTap: (){
                      pickImageFromGallery(context);
                      Navigator.pop(context);
                    },
                    leading: Icon(Icons.browse_gallery),
                    title: Text("Gallery"),
                  ),
                ],
              ),
            ),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: Colors.grey[200],

          );

        });
  }
  Future<void> showUserNameDialogueAlert(BuildContext context,String userName)async{
    namecontroller.text=userName;
    return showDialog(context: context,
        builder:(context){
          return AlertDialog(
            title: Text("Update User Name"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Text_FormField(
                    controller: namecontroller,
                    focusnode: namefocusnode,
                    labeltext: "Name",
                    value: userName,
                    obscure: false,
                    current: namefocusnode,

                  ),
                ],

              ),
            ),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('Cancel')),
              TextButton(onPressed: (){
                ref.child(SessionController().userId.toString()).update({
                  'name': namecontroller.text.toString()
                }).then((value){
                  namecontroller.clear();
                });
              },
                  child: Text('Update'))
            ],
          );
        });
  }
  Future<void> showMobileNumberDialogueAlert(BuildContext context,String mobileNumber)async{
    mobileNumbercontroller.text=mobileNumber;
    return showDialog(context: context,
        builder:(context){
          return AlertDialog(
            title: Text("Update Mobile Number"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Text_FormField(
                    controller: mobileNumbercontroller,
                    focusnode: mobileNumberfocusnode,
                    labeltext: "Mobile Number",
                    value: mobileNumber,
                    obscure: false,
                    current: mobileNumberfocusnode,

                  ),
                ],

              ),
            ),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('Cancel')),
              TextButton(onPressed: (){
                ref.child(SessionController().userId.toString()).update({
                  'mobile': mobileNumbercontroller.text.toString()
                }).then((value){
                  mobileNumbercontroller.clear();
                });
              },
                  child: Text('Update'))
            ],
          );
        });
  }



}