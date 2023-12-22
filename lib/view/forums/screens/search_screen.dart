import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_app/models/all_posts_model.dart';
import 'package:plants_app/view/forums/cubit/cubit.dart';
import 'package:plants_app/view/forums/cubit/states.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/constant.dart';
import '../../../core/widgets/custom_search.dart';
import '../../../core/widgets/search_empty.dart';


class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);
 final TextEditingController? textController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForumsCubit, ForumsStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        ForumsCubit cubit =ForumsCubit.get(context);
        return Scaffold(
          appBar:AppBar(
            elevation: 0.0,
            centerTitle: true,
            leading:IconButton(
              onPressed: (){
                Navigator.pop(context);
                cubit.searchPost.clear();
              },
              icon:const Icon(Icons.arrow_back) ,
            ) ,
            title: const Text('Search',
              style: TextStyle(color: Colors.black),
            ),
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.transparent,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  CustomSearch(
                    textController:textController ,
                    onChanged: (value) {
                      cubit.search(value);
                    },
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: BuildCondition(
                      condition:(cubit.searchPost.isNotEmpty) ,
                      builder:(context)=>ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) => BuildItem(cubit.searchPost[index]),
                          separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                          itemCount: cubit.searchPost.length) ,
                      fallback:(context)=>SearchEmpty(textController!.text) ,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class BuildItem extends StatelessWidget {
   BuildItem(this.data,{Key? key}) : super(key: key);
final DataPosts? data;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: Colors.grey[300]!),
              right: BorderSide(color: Colors.grey[300]!),
              top: BorderSide(color: Colors.grey[300]!),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        '${data!.user!.imageUrl}'),
                  ),
                  title: Text('${data!.user!.firstName} ${data!.user!.lastName}'),
                  subtitle: const Text(
                    'a month ago',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Text(
                  '${data!.title}',
                  style: const TextStyle(
                    color: primerColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    '${data!.description}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        if (data!.imageUrl!.isNotEmpty)
        Image.network(
          '$baseUrl${data!.imageUrl}',
          fit: BoxFit.fill,
          width: double.infinity,
          height: 160,
          errorBuilder: (context, exception, stackTrace) {
            return  Shimmer(
              gradient: LinearGradient(
                  colors: [Colors.grey,Colors.grey[200]!,]
              ),
              child: Container(
                height:160,
              ),
            );
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                /* cubit.postLike(id: data!.forumId!);
                print('id for like ${data!.forumId!}');*/
              },
              child: Icon(
                Icons.thumb_up_alt_outlined,
                color: primerColor,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              '${data!.forumLikes.length} likes',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(width: 50),
            InkWell(
              onTap: () {
                /* navPush(context: context, page: CommentScreen(id:data!.forumId!,));*/
              },
              child: Text(
                '${data!.forumComments.length} Replies',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
