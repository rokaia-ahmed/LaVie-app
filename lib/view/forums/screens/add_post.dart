import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_app/core/components/component.dart';
import 'package:plants_app/core/utils/app_colors.dart';
import 'package:plants_app/core/widgets/custom_button.dart';
import 'package:plants_app/core/widgets/custom_text_form_field.dart';
import 'package:plants_app/view/forums/cubit/cubit.dart';
import 'package:plants_app/view/forums/cubit/states.dart';
import 'package:plants_app/view/forums/screens/forums_screen.dart';

class AddPost extends StatelessWidget {
  AddPost({Key? key}) : super(key: key);
  final titleController = TextEditingController();
  final decController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForumsCubit, ForumsStates>(
      listener: (context, state) {
        ForumsCubit cubit= ForumsCubit.get(context);
        if(state is AddPostsSuccessState){
          cubit.getMyPosts();
          toast(text: 'post added', state: ToastStates.success);
          cubit.currentIndex =1;
          cubit.image = null ;
          cubit.img64 =null;
          navPush(context: context, page: const ForumsScreen());
        }
      },
      builder: (context, state) {
        ForumsCubit cubit =ForumsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: const Text('Create new post',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(state is AddPostsLoadingState)
                     const LinearProgressIndicator(color: primerColor),
                    (cubit.image ==null) ?
                    Center(
                      child: InkWell(
                        onTap: (){
                          cubit.addImage();
                        },
                        child: Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: primerColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.add,
                                color: primerColor,
                              ),
                              SizedBox(height: 10,),
                              Text('Add photo',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: primerColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ) :
                    Center(
                    child: Image.file(cubit.image!,
                      height: 130,
                      width: 130,
                    ),
                    ),
                    const SizedBox(height: 15,),
                    const Text('Title',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 5,),
                    CustomTextForm(controller: titleController),
                    const SizedBox(height: 15,),
                    const Text('Description',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextFormField(
                        controller: decController,
                        cursorColor: primerColor,
                        cursorHeight: 25,
                        maxLines: 7,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            )
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    CustomButton(onTab: () {
                      cubit.addPost(
                          title: titleController.text,
                          dec: decController.text,
                          image:'data:image/png;base64,${cubit.img64}',
                      );
                    },
                      text: 'post',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
