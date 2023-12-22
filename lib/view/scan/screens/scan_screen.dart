import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:plants_app/core/components/component.dart';
import 'package:plants_app/core/utils/media_quary.dart';
import 'package:plants_app/view/scan/cubit/cubit.dart';
import 'package:plants_app/view/scan/cubit/state.dart';
import 'package:plants_app/view/scan/screens/scan_details.dart';


class ScanScreen extends StatelessWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScannerCubit, ScannerStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return InkWell(
          onTap: () {
            ScannerCubit.get(context).scanCode().then((value){
              navPush(context: context, page:const ScanDetails());
            });
          },
          child: Image.asset('assets/images/img_3.png',
            height: context.height,
            width: context.width,
            fit: BoxFit.fill,
          ),
        );
      },
    );
  }
}