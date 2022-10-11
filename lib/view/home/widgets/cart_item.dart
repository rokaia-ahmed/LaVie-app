import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:plants_app/core/utils/app_colors.dart';
import 'package:plants_app/core/utils/constant.dart';
import 'package:plants_app/view/home/cubit/cubit.dart';
import 'package:shimmer/shimmer.dart';

class CartItem extends StatelessWidget {
   CartItem({Key? key,required this.item,required this.cubit}) : super(key: key);
    Map item;
    HomeCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child:Padding(
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
              child: (item['image'] != '') ? Image.network('$baseUrl${item['image']}',
               /* height:80,
                width: 80,*/
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
              ):Image.asset('assets/images/img_2.png',
               height: 60,
                width: 70,
                fit:BoxFit.contain,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Text('${item['text']}',
                 style:const TextStyle(
                   fontSize: 18,
                   fontWeight: FontWeight.bold,
                 ),
                 ),
                 const SizedBox(height: 10,),
                  Text('${item['total']} EGP',
                    style:const TextStyle(
                      fontSize: 16,
                      color: primerColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                   // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                           mainAxisSize: MainAxisSize.min,
                           mainAxisAlignment:MainAxisAlignment.spaceAround ,
                          children: [
                            InkWell(
                              onTap:(){
                                cubit.updateDatabase(
                                  id:item['id'],
                                  count: item['count']-1,
                                );
                              } ,
                              autofocus:true ,
                              child:const Icon(
                                Icons.remove,
                                color: primerColor,
                                size: 28,
                              ),
                            ),
                            Text('${item['count']}',
                             style:const TextStyle(fontWeight: FontWeight.bold) ,
                            ),
                            InkWell(
                              onTap:(){
                                cubit.updateDatabase(
                                  id:item['id'],
                                  count: item['count']+1,
                                );
                              } ,
                              child:const Icon(Icons.add,
                                color: primerColor,
                                size: 28,
                              ),
                            ),
                          ],
                        ),
                      ),
                     const Spacer(),
                      IconButton(
                          onPressed: (){
                            cubit.deleteDatabase(id:item['id']);
                          },
                          icon:const Icon(Icons.delete,
                          color: primerColor,
                          ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ) ,
    );
  }
}
