import 'package:buildcondition/buildcondition.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:plants_app/core/components/component.dart';
import 'package:plants_app/core/utils/app_colors.dart';
import 'package:plants_app/view/profile/cubit/cubit.dart';
import 'package:plants_app/view/profile/cubit/state.dart';
import 'package:plants_app/view/profile/screens/update_user.dart';
import '../widgets/custom_material_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ProfileCubit cubit = BlocProvider.of(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
            ],
            backgroundColor: Colors.transparent,
          ),
          body: BuildCondition(
            condition: (cubit.userModel != null),
            builder: (context) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                        '${cubit.userModel!.imageUrl}',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${cubit.userModel!.firstName} ${cubit.userModel!.lastName}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      ),
                      //color: Colors.red,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 55,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: primerColor.withOpacity(0.1),
                            ),
                            child: Row(children: [
                              Image.asset('assets/images/Group 1264.png'),
                              const SizedBox(width: 10),
                              Text(
                                'you have ${cubit.userModel!.userPoints} point',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                            ]),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Edit profile',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomMaterialButton(
                            text: 'Change Name',
                            onPressed: () {
                              cubit.isName = true;
                              navPush(context: context, page: UpdateUser());
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomMaterialButton(
                            text: 'Change Email',
                            onPressed: () {
                              cubit.isName = false;
                              navPush(context: context, page: UpdateUser());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            fallback: (context) => const Center(
                child: CircularProgressIndicator(
              color: primerColor,
            )),
          ),
        );
      },
    );
  }
}
