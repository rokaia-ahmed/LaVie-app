import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_app/core/components/component.dart';
import 'package:plants_app/core/utils/app_colors.dart';
import 'package:plants_app/view/profile/cubit/cubit.dart';
import 'package:plants_app/view/profile/cubit/state.dart';
import 'package:plants_app/view/profile/screens/profile_screen.dart';

import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_form_field.dart';

class UpdateUser extends StatelessWidget {
  UpdateUser({Key? key}) : super(key: key);
   final updateFirstName = TextEditingController();
  final updateLastName = TextEditingController();
  final updateEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit,ProfileStates>(
      listener: (context, state) {
        ProfileCubit cubit = ProfileCubit.get(context);
        if(state is UpdateUserDataSuccess){
           cubit.getUser();
          toast(text: '${cubit.updateUserModel!.message}', state:ToastStates.success);
          navPush(context: context, page: const ProfileScreen());
        }else if(state is UpdateUserDataError){
          toast(text: '${cubit.updateUserModel!.message}', state:ToastStates.error);
        }
      },
      builder: (context, state) {
        ProfileCubit cubit = BlocProvider.of(context);
        if(cubit.userModel !=null){
          updateFirstName.text = cubit.userModel!.firstName;
          updateLastName.text = cubit.userModel!.lastName;
          updateEmail.text = cubit.userModel!.email;
        }
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            title: Text('Update ${cubit.isName?'name' :'email'}',
             style:const TextStyle(color: Colors.black),
            ) ,
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
            backgroundColor: Colors.transparent,
          ),
          body: BuildCondition(
            condition:(cubit.userModel !=null) ,
            builder:(context)=> SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    const SizedBox(height:150,),
                    CustomTextForm(
                      controller:(cubit.isName)? updateFirstName : updateEmail,
                      lapelText:(cubit.isName)? 'first name':'email',
                    ),
                    const SizedBox(height:15,),
                    if(cubit.isName)
                    CustomTextForm(
                      controller: updateLastName,
                      lapelText:'last name',
                    ),
                    const SizedBox(height:15,),
                   /* CustomTextForm(
                      controller: updateEmail,
                      lapelText:'email',
                    ),
                    const SizedBox(height: 20,),*/
                    CustomButton(
                      onTab: (){
                        cubit.updateUserData(
                          email: updateEmail.text,
                          firstName: updateFirstName.text,
                          lastName: updateLastName.text,
                        );
                      },
                      text: 'update',
                    ),
                    const SizedBox(height: 10,),
                    if(state is UpdateUserDataLoading)
                      const Center(child: CircularProgressIndicator(color: primerColor,)),
                  ],
                ),
              ),
            ),
            fallback:(context)=> const Center(child: CircularProgressIndicator(color: primerColor,)),
          ),
        );
      },
    );
  }
}
