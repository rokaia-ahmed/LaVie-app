import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:fluttertoast/fluttertoast.dart';

void toast({
  required String text,
  required ToastStates state ,
}){
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: shoosToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0
  );
}
enum ToastStates{success, error ,warning}

Color shoosToastColor(ToastStates state){
  Color color ;
  switch(state)
  {
    case  ToastStates.success :
      color = Colors.green ;
      break;
    case  ToastStates.error :
      color = Colors.red ;
      break;
    case  ToastStates.warning:
      color = Colors.yellow ;
      break;

  }
  return color ;
}
///////////////////////////////////////////////////////////

void navPush({required context,required page}){
   Navigator.push(context,
      MaterialPageRoute(builder: (context)=>page),
  );
}
///////////////////////////////////////////////////////////
void navReplace({required context,required page}){
  Navigator.pushReplacement(context,
    MaterialPageRoute(builder: (context)=>page),
  );
}