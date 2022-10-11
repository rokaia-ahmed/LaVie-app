import 'package:flutter/material.dart';

class CustomListTail extends StatelessWidget {
   CustomListTail({this.text,this.subtext,this.image,Key? key}) : super(key: key);
  String? text;
  String? subtext;
  String? image;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth:50 ,
      leading:Container(
        width: 50,
        height:50,
        padding:const EdgeInsets.all(10),
        decoration:BoxDecoration(
            color: Colors.black.withOpacity(0.6),
            borderRadius: BorderRadius.circular(15)
        ) ,
        child:Image.asset(image!,
        ) ,
      ) ,
      title:Text(text!,
        style:const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ) ,
      subtitle:Text(subtext!,
        style:const TextStyle(
          color: Colors.white,
        ),
      ) ,
    );
  }
}
