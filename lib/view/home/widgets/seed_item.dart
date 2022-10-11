import 'package:buildcondition/buildcondition.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_app/models/seeds_model.dart';
import 'package:plants_app/view/home/cubit/cubit.dart';
import 'package:plants_app/view/home/cubit/states.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/constant.dart';


class SeedItem extends StatelessWidget {
  const SeedItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,states){},
      builder:(context,states){
        HomeCubit cubit = BlocProvider.of(context);
        return BuildCondition(
          condition:cubit.seedsList.isNotEmpty ,
          builder:(context) =>GridView.builder(
            itemCount: cubit.seedsList.length,
            clipBehavior: Clip.none,
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1/1.6,
              crossAxisSpacing: 10,
            ) ,
            itemBuilder: (context,index)=>BuildItem(model: cubit.seedsList[index],cubit: cubit),
          ),
          fallback:(context)=>const Center(child: CircularProgressIndicator(color: primerColor,)) ,
        );
      } ,
    );
  }
}
class BuildItem extends StatelessWidget {
  const BuildItem({Key? key, required this.model,required this.cubit}) : super(key: key);
 final SeedsModel model;
 final HomeCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      clipBehavior: Clip.none,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height:40,),
            SizedBox(
              height: 200,
              //width: 230,
              child: Card(
                color: Colors.white,
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width:20,
                            height:20 ,
                            color: Colors.grey[200],
                            child:const Center(
                              child:
                              Text('-',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 21,
                                ),
                              ),
                            ) ,
                          ),
                          const SizedBox(width:5),
                          const Text('1'),
                          const SizedBox(width: 5),
                          Container(
                            width:20,
                            height:20 ,
                            color: Colors.grey[200],
                            child:const Center(
                                child: Text('+',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                )) ,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Text('${model.name}',
                        style: const TextStyle(
                          fontSize:16,
                          fontWeight: FontWeight.bold,
                        ) ,
                      ),
                      const SizedBox(
                        height:5,
                      ),
                      const Text('70 EGP',
                        style:TextStyle(
                          fontSize:16,
                          fontWeight: FontWeight.w500,
                        ) ,
                      ),
                      const SizedBox(
                        height:5,
                      ),
                      MaterialButton(
                        onPressed: (){
                          cubit.insertDatabase(
                              name: model.name!,
                              price: 70,
                              image: model.imageUrl!
                          );
                        },
                        height: 40,
                        minWidth: double.infinity,
                        color: primerColor,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        child: const Text('Add To Card',
                          style:TextStyle(
                            fontSize:16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ) ,
                        ) ,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom:145,
          right: 70,
          child:(model.imageUrl!.isNotEmpty)? Image.network('$baseUrl${model.imageUrl}',
            width:90,
            height:120,
          ):Image.asset('assets/images/img_2.png',
            width: 85,
            height: 120,
          ),
        ),
      ],
    );
  }
}