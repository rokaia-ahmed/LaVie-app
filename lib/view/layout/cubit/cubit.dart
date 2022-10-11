
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:plants_app/view/forums/screens/forums_screen.dart';
import 'package:plants_app/view/home/screens/home_screen.dart';
import 'package:plants_app/view/layout/cubit/states.dart';
import 'package:plants_app/view/notification/screens/notification_screen.dart';
import 'package:plants_app/view/profile/screens/profile_screen.dart';
import '../../../core/utils/app_strings.dart';
import '../../../network/cash_helper.dart';
import '../../scan/screens/scan_details.dart';
import '../../scan/screens/scan_screen.dart';

class LayoutCubit extends Cubit<LayoutStates>{
  LayoutCubit() : super(InitLayoutState());
  static LayoutCubit get(context) =>BlocProvider.of(context);

  List<Widget> screens =
  [
    const ForumsScreen(),
    const ScanScreen(),
    const HomeScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];
  int currentIndex=0;
  void changeNaveBar(int index){
    currentIndex = index;
    emit(ChangeNavBarState());
  }

  bool loadLanguageFromBox() =>
      CacheHelper.getData(key: 'en') ?? false;

  saveLanguageToBox(bool isEnglish) =>
      CacheHelper.saveData(key: 'en', value:isEnglish);

  Locale get language =>
      loadLanguageFromBox() ? const Locale('en') : const Locale('ar');
  Locale? languageGroupValue;
  void selectLanguage(newValue, context) {
    languageGroupValue = newValue;
    print(newValue);
    if (languageGroupValue == const Locale('en')) {
      saveLanguageToBox(true);
    } else {
      saveLanguageToBox(false);
    }
    CacheHelper.saveData(
      key: 'en',
      value: loadLanguageFromBox() ? "en" : "ar",
    ).then((value) {
      APPLANGUAGE = newValue;
    });
    Future.delayed(
      const Duration(milliseconds: 300),
          () => Phoenix.rebirth(context),
    );
  }
}