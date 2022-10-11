import 'package:flutter/material.dart';
import 'package:plants_app/core/utils/app_colors.dart';
import 'package:plants_app/core/utils/constant.dart';
import 'package:shimmer/shimmer.dart';
import '../../../models/my_posts_model.dart';

class BuildMyPosts extends StatelessWidget {
  BuildMyPosts({Key? key,this.data}) : super(key: key);
  MyData? data;
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
                  subtitle:const Text(
                    'a month ago',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Text(
                  '${data!.title}',
                  style:const TextStyle(
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
        if(data!.imageUrl!.isNotEmpty)
          Image.network(
            '$baseUrl${data!.imageUrl}',
            fit: BoxFit.fill,
            width: double.infinity,
            height: 160,
            errorBuilder: (context,exception,stackTrace){
              return Shimmer(
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
            Icon(Icons.thumb_up_alt_outlined,
              color: Colors.grey[600],
            ),
            const SizedBox(width: 5),
            Text(
              '${data!.forumLikes.length} likes',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(width: 50),
            Text('${data!.forumComments.length} Replies',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
