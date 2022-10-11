import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_app/core/components/component.dart';
import 'package:plants_app/core/utils/app_colors.dart';
import 'package:plants_app/view/forums/cubit/cubit.dart';
import 'package:plants_app/view/forums/cubit/states.dart';
import 'package:plants_app/view/forums/screens/search_screen.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../core/widgets/custom_search.dart';
import '../widgets/all_forums.dart';
import '../widgets/my_forums.dart';
import 'add_post.dart';


class ForumsScreen extends StatelessWidget {
  const ForumsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForumsCubit, ForumsStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        ForumsCubit cubit = ForumsCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(onPressed: () {},
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
                      const SizedBox(width: 30),
                      const Text('Discussion Forums',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                   CustomSearch(
                     onTap:(){
                       navPush(
                           context:context ,
                           page: SearchScreen()
                       );
                     }
                   ),
                  const SizedBox(height: 10,),
                  ToggleSwitch(
                    minWidth: 120,
                    minHeight: 30,
                    cornerRadius: 10,
                    totalSwitches: 2,
                    labels: const ['All forums', 'My forums'],
                    activeBgColor: const [primerColor],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.transparent,
                    inactiveFgColor: Colors.grey[700],
                    animate: true,
                    animationDuration: 5,
                    changeOnTap: true,
                    initialLabelIndex: cubit.currentIndex,
                    onToggle:(index){
                      cubit.toggle(index);
                    },
                  ),
                  const SizedBox(height: 15,),
                  if(cubit.currentIndex==0)
                  const AllForums(),
                  if(cubit.currentIndex==1)
                    const MyForums(),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed:(){
              navPush(context: context, page: AddPost());
            } ,
            backgroundColor:primerColor ,
            child:const Icon(Icons.add,
            size: 35,
            ) ,
          ),
        );
      },
    );
  }
}