import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_app/core/utils/media_quary.dart';
import 'package:plants_app/core/components/component.dart';
import 'package:plants_app/core/widgets/custom_button.dart';
import 'package:plants_app/core/widgets/custom_divider.dart';
import 'package:plants_app/view/layout/layout.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/constant.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../network/cash_helper.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener:(context,state){
          LoginCubit cubit = BlocProvider.of(context);
          if(state is LoginSuccessState){
            CacheHelper.saveData(key: 'token', value:cubit.loginModel!.data!.accessToken!).then((value){
              token = cubit.loginModel!.data!.accessToken!;
              toast(text:cubit.loginModel!.message! , state:ToastStates.success);
              navReplace(context: context,page:const Layout());
            });
          }else if(state is LoginErrorState){
            toast(text:state.error , state:ToastStates.error);
          }
        } ,
        builder:(context,state){
          LoginCubit cubit = BlocProvider.of(context);
          return ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 25,),
                      Text('E-mail',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700]),
                      ),
                      CustomTextForm(
                        controller:emailController ,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'enter email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15,),
                      Text('Password',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700]),
                      ),
                      CustomTextForm(
                        controller:passwordController ,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'enter password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 25,),
                      CustomButton(
                        onTab:(){
                          if(formKey.currentState!.validate()){
                            cubit.loginUser(
                                email: emailController.text,
                                password: passwordController.text);
                          }
                        },
                        text: 'Login',
                      ),
                      const SizedBox(height:15,),
                      const CustomDivider(),
                      const SizedBox(height:15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (){},
                            child: Image.asset(
                              'assets/images/img_1.png',
                              height: 30,
                              width: 30,
                            ),
                          ),
                          const SizedBox(width: 10,),
                          IconButton(
                            padding: EdgeInsets.zero,
                            autofocus: false,
                            onPressed: (){},
                            icon:const Icon(Icons.facebook_sharp,
                              color: Colors.blue,
                              size: 35,
                            ),
                          ),
                        ],
                      ),
                      if(state is LoginLoadingState)
                       const Center(
                           child: CircularProgressIndicator(color:primerColor,)
                       ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: context.height/8,),
              Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset('assets/images/img.png',
                  height:100,
                ),
              ),
            ],
          );
        } ,
      ),
    );
  }
}
