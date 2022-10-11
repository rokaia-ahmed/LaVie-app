import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_app/l10n/l10n.dart';
import 'package:plants_app/view/forums/cubit/cubit.dart';
import 'package:plants_app/view/home/cubit/cubit.dart';
import 'package:plants_app/view/layout/cubit/cubit.dart';
import 'package:plants_app/view/layout/cubit/states.dart';
import 'package:plants_app/view/layout/layout.dart';
import 'package:plants_app/view/profile/cubit/cubit.dart';
import 'package:plants_app/view/scan/cubit/cubit.dart';
import 'package:plants_app/view/splash/splash_screen.dart';
import 'core/utils/app_strings.dart';
import 'core/utils/constant.dart';
import 'network/cash_helper.dart';
import 'network/dio_helper.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  late Widget widget;
  token = CacheHelper.getData(key: 'token') ?? '';
  APPLANGUAGE = CacheHelper.getData(key: 'en');
  print(token);
  if (token.isEmpty) {
    widget = SplashPage();
    // widget = CommentTestScreen();
  } else {
    widget = Layout();
    // widget = CommentTestScreen();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({Key? key, required this.startWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LayoutCubit()),
        BlocProvider(
          create: (context) => HomeCubit()
            ..getPlants()
            ..getSeeds()
            ..getTools()
            ..getProducts()
            ..createDatabase(),
        ),
        BlocProvider(create: (context) => ProfileCubit()..getUser()),
        BlocProvider(create: (context) => ForumsCubit()..getAllPosts()..getMyPosts()
        ),
        BlocProvider(create: (context) => ScannerCubit()..getBlogs()),
      ],
      child: BlocConsumer<LayoutCubit,LayoutStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
           // locale:LayoutCubit.get(context).language,
            /*supportedLocales: L10n.all,
            localizationsDelegates:const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],*/
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            home: startWidget,
          );
        },
      ),
    );
  }
}
