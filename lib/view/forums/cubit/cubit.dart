import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plants_app/models/all_posts_model.dart';
import 'package:plants_app/models/details_post_model.dart';
import 'package:plants_app/models/my_posts_model.dart';
import 'package:plants_app/network/dio_helper.dart';
import 'package:plants_app/view/forums/cubit/states.dart';
import '../../../core/utils/constant.dart';
import '../../../models/like_model.dart';
import '../../../network/end_point.dart';

class ForumsCubit extends Cubit<ForumsStates> {
  ForumsCubit() :super(InitForumState());

  static ForumsCubit get(context) => BlocProvider.of(context);
  AllPostsModel? allPostsModel;
  int currentIndex = 0;

  void toggle(index) {
    currentIndex = index;
    emit(ToggleForumState());
  }

  //TODO GET ALL POSTS
  void getAllPosts() {
    emit(GetAllPostsLoadingState());
    DioHelper.getData(
      url: allPosts,
      token: token,
    ).then((value) {
      allPostsModel = AllPostsModel.fromJson(value.data);
     // print('postId${allPostsModel!.data[0].forumId}');
      emit(GetAllPostsSuccessState());
    }).catchError((error) {
      if (error is DioError) {
        print('==================${error.response}');
      }
      emit(GetAllPostsErrorState(error.toString()));
      print(error.toString());
    });
  }
  //TODO SEARCH
  List<DataPosts> searchPost=[];

  void search(String text){
    searchPost.clear();
   for(int i=0 ;i< allPostsModel!.data.length;i++){
     if(allPostsModel!.data[i].title!.contains(text)){
       searchPost.add(allPostsModel!.data[i]);
     }
   }
   emit(SearchState());
  }

  //TODO ADD IMAGE
  ImagePicker picker = ImagePicker();
  File? image;
  Uint8List? bytes;
  String? img64;

  Future<void> addImage() async {
    final pickedFile =
    await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      bytes = File(image!.path).readAsBytesSync();
      img64 = base64Encode(bytes!);
      print(img64);
      emit(SuccessPickImageState());
    } else {
      print('No image selected.');
      emit(ErrorPickImageState());
    }
  }

//TODO ADD POST
  void addPost({
    required String title,
    required String dec,
    required String image,
  }) {
    emit(AddPostsLoadingState());
    DioHelper.postData(
      url: addPosts,
      token: token,
      data: {
        "title": title,
        "description": dec,
        "imageBase64": image,
      },
    ).then((value) {
      print(value.data);
      emit(AddPostsSuccessState());
    }).catchError((error) {
      if (error is DioError) {
        print('=========${error.response}');
      }
      emit(AddPostsErrorState(error.toString()));
      print(error.toString());
    });
  }

  //TODO GET MY POSTS
  MyPostsModel? myPostsModel;

  void getMyPosts() {
    emit(GetMyPostsLoadingState());
    DioHelper.getData(
        url: myPosts, token: token
    ).then((value) {
      myPostsModel = MyPostsModel.fromJson(value.data);
      //print('=======${myPostsModel!.data[0].title}');
      emit(GetMyPostsSuccessState());
    }).catchError((error) {
      emit(GetMyPostsErrorState(error.toString()));
      print(error.toString());
    });
  }

  //TODO LIKE
  LikeModel? likeModel;

  Future<void> postLike({required String id}) async{
    emit(LikeLoadingState());
   await DioHelper.postData(
      url: '/api/v1/forums/$id/like?forumId=$id',
      token: token,
      query: {'forumId': id},
    ).then((value) {
      print(value.data['message']);
      likeModel = LikeModel.fromJson(value.data);
      emit(LikeSuccessState());
    }).catchError((error) {
      if (error is DioError) {
        print('-------------------${error.response}');
      }
      emit(LikeErrorState(error.toString()));
      print(error.toString());
    });
  }

  //bool isLike = false;

  //todo get details post
  DetailsPostModel? detailsPostModel;
  Future<void> getDetailsPost({required String id})async {
    emit(DetailsPostLoadingState());
   await DioHelper.getData(
      url: '/api/v1/forums/$id',
      token: token,
    ).then((value) {
      detailsPostModel =DetailsPostModel.fromJson(value.data);
      print('details of post ${detailsPostModel!.data!.forumComments.length}');
      emit(DetailsPostSuccessState());
    }).catchError((error) {
      emit(DetailsPostErrorState(error.toString()));
      print(error.toString());
    });
  }

  //TODO COMMENT
  Future<void> postComment({required String id, required String comment})async {
    emit(CommentLoadingState());
   await DioHelper.postData(
      url: '/api/v1/forums/$id/comment',
      token: token,
      data: {
        'comment': comment,
      },
    ).then((value) {
      //getAllPosts();
      emit(CommentSuccessState());
      print('Success comment ${value.data}');
    }).catchError((error) {
      emit(CommentErrorState(error.toString()));
      if (error is DioError) {
        print('error when comment ${error.response}');
      }
      print('error when comment ${error.toString()}');
    });
  }
}
