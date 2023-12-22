import 'package:flutter/material.dart';


class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({Key? key,required this.text,required this.onPressed}) : super(key: key);
  final String text ;
  final VoidCallback onPressed ;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: 60,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide:const BorderSide(color: Colors.grey)
      ),
      onPressed:onPressed,
      child: Row(
        children: [
          Image.asset('assets/images/icon.png'),
          const SizedBox(width: 20,),
           Text(text,
            style:const TextStyle(
              //fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_outlined)
        ],
      ),
    );
  }
}
