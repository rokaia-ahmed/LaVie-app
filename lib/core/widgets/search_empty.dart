import 'package:flutter/material.dart';
import 'package:plants_app/core/utils/app_colors.dart';

class SearchEmpty extends StatelessWidget {
   SearchEmpty(this.text,{Key? key}) : super(key: key);
  String? text;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              const Text('Results for ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
               Text('"$text" ',
                style:const TextStyle(
                  fontSize: 20,
                  color: primerColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const Text('0 found',
                style: TextStyle(
                  fontSize: 18,
                  color: primerColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
         const SizedBox(height: 100),
          Center(child: Image.asset('assets/images/Frame.png')),
          const SizedBox(height: 10),
         const Text('Not Found',
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
          ),
          ),
          const SizedBox(height: 10),
           Text('Sorry, the keyword you entered cannot be found, please check again or search with another keyword.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[400]!,

              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
