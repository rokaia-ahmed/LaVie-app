import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_app/core/utils/app_colors.dart';
import 'package:plants_app/view/forums/cubit/cubit.dart';
import 'package:plants_app/view/forums/cubit/states.dart';
import 'build_all_posts.dart';

class AllForums extends StatelessWidget {
  const AllForums({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForumsCubit, ForumsStates>(
      listener: (context, state) {
        ForumsCubit cubit = ForumsCubit.get(context);
        if(state is LikeSuccessState){
          cubit.getAllPosts();
        }
      },
      builder: (context, state) {
        ForumsCubit cubit = ForumsCubit.get(context);
        return BuildCondition(
          condition: (cubit.allPostsModel !=null ),
          builder: (context){
            return Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) =>BuildAllPosts(data:cubit.allPostsModel!.data[index], ),
                  separatorBuilder: (context, index) =>
                  const SizedBox(height: 10,),
                  itemCount:cubit.allPostsModel!.data.length ,
              ),
            );
          },
          fallback: (context) =>
          const Center(child: CircularProgressIndicator(color: primerColor,)),
        );
      },
    );
  }
}
