import 'package:flutter/material.dart';
import 'package:madproject/utils/utils/utils.dart';
class Text_FormField extends StatefulWidget {
  var controller,focusnode,labeltext,value,obscure,keyboardtype,current,nextFocus;
   Text_FormField({Key? key, this.controller, this.focusnode, this.labeltext, this.value, this.obscure,this.keyboardtype,this.current,this.nextFocus}) : super(key: key);

  @override
  State<Text_FormField> createState() => _Text_FormFieldState();
}

class _Text_FormFieldState extends State<Text_FormField> {
  @override
  Widget build(BuildContext context) {
    
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusnode,
      keyboardType: widget.keyboardtype,
      decoration: InputDecoration(
        labelText: widget.labeltext,
        labelStyle: TextStyle(
            fontSize: 16.0,
            fontFamily: 'DancingScript'),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide:
          BorderSide(color: Colors.red, width: 2.0),
        ),
        prefixIcon: Icon(Icons.person),
        suffixIcon: Icon(Icons.check_circle,
            color: Colors.green),
        hintStyle: TextStyle(
            fontSize: 14.0, color: Colors.grey),
        errorStyle: TextStyle(
            fontSize: 14.0, color: Colors.red),
      ),
      onFieldSubmitted: (value){
        Utils.fieldFocusChange(context, widget.current, widget.nextFocus);

      },
      cursorColor: Colors.purple,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your '+widget.labeltext;
        }
        return null;
      },
      onSaved: (value) => widget.value = value!,
      obscureText: widget.obscure,
    );
  }
}
