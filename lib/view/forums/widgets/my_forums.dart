import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/app_colors.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import 'build_my_posts.dart';


class MyForums extends StatelessWidget {
  const MyForums({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForumsCubit, ForumsStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        ForumsCubit cubit = ForumsCubit.get(context);
        return BuildCondition(
          condition: (cubit.myPostsModel !=null && cubit.myPostsModel!.data.isNotEmpty),
          builder: (context) {
            return Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => BuildMyPosts(data: cubit.myPostsModel!.data.reversed.toList()[index]),
                  separatorBuilder: (context, index) =>
                  const SizedBox(height: 10,),
                  itemCount: cubit.myPostsModel!.data.length),
            );
          },
          fallback: (context) =>
          const Center(child: CircularProgressIndicator(color: primerColor,)),
        );
      },
    );
  }
}
