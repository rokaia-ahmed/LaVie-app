import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:plants_app/core/utils/media_quary.dart';
import '../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key,this.text,required this.onTab}) : super(key: key);
   final String? text;
   final VoidCallback onTab ;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: primerColor,
      height:context.height/17 ,
      minWidth: context.width,
      onPressed: onTab,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
      ),
      child:  Text(text!,
        style:const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
