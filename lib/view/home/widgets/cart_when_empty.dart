import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


class EmptyCard extends StatelessWidget {
  const EmptyCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height:100),
          Image.asset('assets/images/Frame.png'),
          const SizedBox(height: 10),
          const Text('Your cart is empty',
           style: TextStyle(
             fontWeight: FontWeight.bold,
             fontSize: 20,
           ),
          ),
        ],
      ),
    );
  }
}
