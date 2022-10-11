import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_app/view/layout/cubit/cubit.dart';
import 'package:plants_app/view/layout/cubit/states.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit ,LayoutStates>(
      listener: (context,state){},
      builder:(context,state){
        LayoutCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: CurvedNavigationBar(
            height: 60.0,
            index:cubit.currentIndex ,
            onTap:(i){
              cubit.changeNaveBar(i);
            } ,
            //letIndexChange: ,
            items: [
              Image.asset('assets/images/forums.png',
                color:(cubit.currentIndex==0)?Colors.white : Colors.black,
                height: 35,
                width: 35,
              ),
              Image.asset('assets/images/scan.png',
                color:(cubit.currentIndex==1)?Colors.white : Colors.black,
                height: 25,
                width: 25,
              ),
              Image.asset('assets/images/home.png',
                color:(cubit.currentIndex==2)?Colors.white : Colors.black,
                height: 28,
                width: 28,
              ),
              Image.asset('assets/images/notif.png',
                color:(cubit.currentIndex==3)?Colors.white : Colors.black,
                height: 25,
                width: 25,
              ),
              Image.asset('assets/images/profile.png',
                color:(cubit.currentIndex==4)?Colors.white : Colors.black,
                height: 25,
                width: 25,
              ),
            ],
            color: Colors.white,
            animationCurve: Curves.easeInOut,
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: Colors.green,
            animationDuration: const Duration(milliseconds: 600),
          ) ,
        );
      } ,
    );
  }
}
