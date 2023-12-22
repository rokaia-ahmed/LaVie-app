import 'package:flutter/material.dart';


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
