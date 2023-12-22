
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_app/core/components/component.dart';
import 'package:plants_app/core/utils/app_colors.dart';
import 'package:plants_app/view/home/screens/cart_screen.dart';
import 'package:plants_app/view/home/cubit/cubit.dart';
import 'package:plants_app/view/home/cubit/states.dart';
import 'package:plants_app/view/home/screens/search_screen.dart';
import 'package:plants_app/view/home/widgets/all_products_item.dart';
import 'package:plants_app/view/home/widgets/plant_item.dart';
import 'package:plants_app/view/home/widgets/seed_item.dart';
import 'package:plants_app/view/home/widgets/tool_item.dart';

import '../../../core/widgets/custom_search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,states){},
      builder:(context,states){
        return DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0.0,
              title: Image.asset(
                'assets/images/logo.png',
                height: 40,
                width: 90,
              ),
              actions: const [
                InkWell(
                  child: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: CircleAvatar(
                      backgroundColor: primerColor,
                      radius: 21,
                      child: Icon(
                        Icons.question_mark,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomSearch(
                          onTap:(){
                            navPush(
                                context: context,
                                page: SearchScreen());
                          } ,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      MaterialButton(
                        onPressed: () {
                          navPush(context: context, page: CartScreen());
                        },
                        color: primerColor,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        minWidth: 40,
                        height: 40,
                        child: const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 35,
                    child: TabBar(
                      unselectedLabelColor: Colors.grey,
                      labelColor: primerColor,
                      splashBorderRadius: BorderRadius.circular(8),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorWeight: 0.2,
                      indicator: BoxDecoration(
                        color: grayColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: primerColor,
                          width: 1.8,
                        ),
                      ),
                      tabs: const [
                        Tab(
                          text: 'All',
                        ),
                        Tab(
                          text: 'Plants',
                        ),
                        Tab(
                          text: 'Seeds',
                        ),
                        Tab(
                          text: 'Tools',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height:10,),
                  const Flexible(
                    child: TabBarView(
                        children: [
                          ProductsItem(),
                          PlantItem(),
                          SeedItem(),
                          ToolItem(),
                        ]
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      } ,
    );
  }
}
