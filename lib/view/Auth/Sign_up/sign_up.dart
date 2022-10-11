import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_app/core/utils/app_colors.dart';
import 'package:plants_app/core/components/component.dart';
import 'package:plants_app/core/widgets/custom_button.dart';
import '../../../core/widgets/custom_divider.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../layout/layout.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? validatePassword(String value) {
    RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-8])(?=.*?[._!@#\\$&*~-]).{8,}$');
    if (value.isEmpty) {
      return 'password must have 8 character';
    } else {
      if (!regex.hasMatch(value)) {
        return 'this password is week ';
      } else {
        return null;
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: BlocConsumer<SignupCubit, SignupStates>(
        listener: (context, state) {
          SignupCubit cubit = BlocProvider.of(context);
          if (state is SignupSuccessState) {
             toast(
                 text: cubit.signupModel!.message!, state: ToastStates.success);
             navReplace(context: context,page:const Layout());

          } else if (state is SignupErrorState) {
            toast(text: '${state.error}', state: ToastStates.error);
          }
        },
        builder: (context, state) {
          SignupCubit cubit = BlocProvider.of(context);
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'First Name',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey[700]),
                              ),
                              CustomTextForm(
                                controller: firstNameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'enter firstname';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          )),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Last Name',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey[700]),
                                ),
                                CustomTextForm(
                                  controller: lastNameController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'enter lastname';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'E-mail',
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                      CustomTextForm(
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Password',
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                      CustomTextForm(
                        controller: passwordController,
                        validator: (value) => validatePassword(value!),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Confirm password',
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                      CustomTextForm(
                        controller: confirmPasswordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enter password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        onTab: () {
                          if(formKey.currentState!.validate()){
                            cubit.signUp(
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                        text: 'Sign up',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const CustomDivider(),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Image.asset(
                              'assets/images/img_1.png',
                              height: 30,
                              width: 30,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            autofocus: false,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.facebook_sharp,
                              color: Colors.blue,
                              size: 35,
                            ),
                          ),
                        ],
                      ),
                      if(state is SignupErrorState)
                       const Center(child: CircularProgressIndicator(color:primerColor,)),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                  'assets/images/img.png',
                  width: 100,
                  height: 75,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
