import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OpenImage {
   late String _tag;
  late String _file;
  OpenImage(String tag,String file){
    this._tag=tag;
    this._file=file;
  }
  void openImage(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Scaffold(
      body: Center(
        child: Hero(
          tag: _tag,
          child: Image.file(File(_file).absolute),
        ),
      ),
    )));

  }
}