import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomSearch extends StatelessWidget {
   CustomSearch({Key? key,this.onTap,this.onChanged,this.textController}) : super(key: key);
  VoidCallback? onTap;
   ValueChanged<String>? onChanged;
   TextEditingController? textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          color: grayColor,
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller:textController ,
        onTap: onTap,
        onChanged:onChanged ,
        cursorColor: primerColor,
        decoration: const InputDecoration(
          hintText: 'search',
          prefixIcon: Icon(Icons.search),
          border: UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
