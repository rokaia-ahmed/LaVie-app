import 'package:flutter/material.dart';


class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text('Notification',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
      ),
      body:ListView.separated(
          itemBuilder: (context,index)=>const BuildItem(),
          separatorBuilder: (context,index)=>const Divider(
            height: 1,
            indent: 10,
            endIndent: 10,
          ),
          itemCount: 10) ,
    );
  }
}
class BuildItem extends StatelessWidget {
  const BuildItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:Image.network('https://th.bing.com/th/id/R.6f400930585bc9ba7a97dcaaa30dd4cd?rik=Zv834NJq7aeWtw&pid=ImgRaw&r=0') ,
      title:const Text('Dennis Nedry commented on Isla Nublar SOC2 compliance report    ',
        style: TextStyle(color: Colors.black,
         fontSize: 14,
        ),
      ),
      subtitle: Text('Yesterday at 5:42 PM',
      style: TextStyle(color: Colors.grey[400]),
    ),
    );
  }
}
