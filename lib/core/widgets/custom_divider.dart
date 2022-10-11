import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Expanded(
          child: Divider(
            color: Colors.grey[600],
            height: 1,
            endIndent: 3,
          ),
        ),
        Text('or continue with',
          style: TextStyle(
              color: Colors.grey[400]),
        ),
         Expanded(
          child: Divider(
            color: Colors.grey[600],
            height: 1,
            indent: 3,
          ),
        ),
      ],
    );
  }
}
