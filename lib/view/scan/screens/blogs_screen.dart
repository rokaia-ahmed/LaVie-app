import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_app/models/blogs_model.dart';
import 'package:plants_app/view/scan/cubit/cubit.dart';
import 'package:plants_app/view/scan/cubit/state.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/constant.dart';

class BlogsScreen extends StatelessWidget {
  const BlogsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScannerCubit, ScannerStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        ScannerCubit cubit =ScannerCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            title: const Text('Blogs',
              style: TextStyle(color: Colors.black),
            ),
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.transparent,
          ),
          body: BuildCondition(
             condition:cubit.allBlogs.isNotEmpty ,
             builder:(context)=>ListView.separated(
                 physics:const BouncingScrollPhysics(),
                 padding: const EdgeInsets.all(15),
                 itemBuilder: (context, index) => BuildItem(model: cubit.allBlogs[index]),
                 separatorBuilder: (context, index) => const SizedBox(height: 10),
                 itemCount: cubit.allBlogs.length) ,
                fallback:(context)=>const Center(child: CircularProgressIndicator(color: primerColor)) ,
          ),
        );
      },
    );
  }
}

class BuildItem extends StatelessWidget {
  const BuildItem({Key? key,required this.model}) : super(key: key);
  final BlogsModel? model;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          //mainAxisSize:MainAxisSize.min,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: (model!.imageUrl!.isNotEmpty) ?
               Image.network('$baseUrl${model!.imageUrl}',
                height:80,
                width: 80,
                cacheHeight:80,
                cacheWidth: 80,
                errorBuilder: (context, exception, stackTrace) {
                  return Shimmer(
                    gradient: LinearGradient(colors: [
                      Colors.grey,
                      Colors.grey[200]!,
                    ]),
                    child: Container(
                      height: 160,
                    ),
                  );
                },
              )
               :Image.asset('assets/images/img_2.png',
                height: 60,
                width: 70,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(model!.name!,
                    style: const TextStyle(
                      color: primerColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10,),
                 const Text('5 Tips to treat plants',
                    style:  TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    '${model!.description}',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
