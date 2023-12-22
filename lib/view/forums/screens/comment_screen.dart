import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:plants_app/core/utils/app_colors.dart';
import 'package:plants_app/view/forums/cubit/cubit.dart';
import 'package:plants_app/view/forums/cubit/states.dart';
import '../../../models/details_post_model.dart';



class CommentScreen extends StatelessWidget {
  CommentScreen({Key? key, required this.idForum }) : super(key: key);
final  TextEditingController commentController = TextEditingController();
 final String? idForum;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => ForumsCubit()..getDetailsPost(id:idForum! ),
      child: BlocConsumer<ForumsCubit, ForumsStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          ForumsCubit cubit = ForumsCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: BuildCondition(
                  condition: ( cubit.detailsPostModel !=null),
                  fallback: (context) =>
                  const Center(
                      child: CircularProgressIndicator(color: primerColor)),
                  builder: (context) {
                    return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        if (index == cubit.detailsPostModel!.data!.forumComments.length) {
                          return const SizedBox(height: 30,);
                        } else {
                          return ItemBuilder(data: cubit.detailsPostModel!.data!.forumComments[index]);
                        }
                      },
                      separatorBuilder: (context, index) =>
                      const SizedBox(height: 10,),
                      itemCount: cubit.detailsPostModel!.data!.forumComments.length + 1,
                    );
                  },
                ),
              ),
            ),
            bottomSheet: Container(
              color: Colors.grey[200],
              child: TextFormField(
                controller: commentController,
                cursorColor: primerColor,
                decoration: InputDecoration(
                  hintText: 'write comment',
                  prefixIcon: const Icon(Icons.comment_bank_outlined,
                    color: primerColor,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      cubit.postComment(
                        id: idForum!,
                        comment: commentController.text,
                      ).then((value) {
                        cubit.getDetailsPost(id: idForum!);
                      });
                      print('text of comment ${commentController.text}');
                    },
                    icon: const Icon(Icons.send,
                      color: primerColor,
                    ),
                  ),
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ItemBuilder extends StatelessWidget {
  ItemBuilder({Key? key, required this.data }) : super(key: key);
 final ForumComment data;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: primerColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                DateFormat.MMMd().format(data.createdAt!),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              Text(
                '${data.comment}',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
