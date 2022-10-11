import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:plants_app/core/utils/app_colors.dart';
class CustomTextForm extends StatelessWidget {
   const CustomTextForm({
     Key? key,this.validator,
     required this.controller,
     this.hintText,
     this.lapelText
   }) : super(key: key);
   final FormFieldValidator<String>? validator;
   final TextEditingController? controller;
   final String? hintText;
   final String? lapelText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        validator: validator,
        controller:controller ,
        cursorColor: primerColor,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: lapelText,
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
          border:const OutlineInputBorder(),
          focusedBorder:const OutlineInputBorder(
            borderSide: BorderSide(color: primerColor),
          ),
        ),
      ),
    );
  }
}
