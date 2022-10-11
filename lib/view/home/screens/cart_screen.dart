import 'package:buildcondition/buildcondition.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_app/core/utils/app_colors.dart';
import 'package:plants_app/view/home/cubit/cubit.dart';
import 'package:plants_app/view/home/cubit/states.dart';
import 'package:plants_app/view/home/widgets/cart_item.dart';
import 'package:plants_app/view/home/widgets/cart_when_empty.dart';
import '../../../core/widgets/custom_button.dart';

class CartScreen extends StatelessWidget {
   CartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener:(context,state) {},
      builder:(context,state) {
        HomeCubit cubit = BlocProvider.of(context);
        return Scaffold(
          appBar: AppBar(
            title:const Text('My Cart',
              style: TextStyle(color: Colors.black),
            ),
            elevation: 0.0,
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.transparent,
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: BuildCondition(
              condition:cubit.cart.isNotEmpty ,
              builder:(context)=>ListView.separated(
                shrinkWrap:true ,
                itemBuilder: (context,index){
                  if(index == cubit.cart.length){
                    return const SizedBox(height: 150,);
                  }else{
                    cubit.countPrice();
                   return CartItem(item: cubit.cart[index],cubit: cubit,);
                  }
                },
                separatorBuilder: (context,index)=>const SizedBox(height: 10,),
                itemCount:cubit.cart.length+1,
              ) ,
              fallback:(context)=> const EmptyCard() ,
            ),
          ),
          bottomSheet: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                   const Text('Total',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('${ (cubit.cart.isNotEmpty)?cubit.total:0} EGP',
                      style:const TextStyle(
                        color: primerColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
               const SizedBox(height: 15),
                CustomButton(
                  onTab: (){},
                  text: 'Checkout',
                ),
              ],
            ),
          ),
        );
      } ,
    );
  }
}
