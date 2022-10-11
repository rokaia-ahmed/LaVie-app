import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_app/models/current_user_model.dart';
import 'package:plants_app/models/update_user_model.dart';
import 'package:plants_app/network/dio_helper.dart';
import 'package:plants_app/view/profile/cubit/state.dart';

import '../../../core/utils/constant.dart';
import '../../../network/end_point.dart';

class ProfileCubit extends Cubit<ProfileStates>{
  ProfileCubit() : super(InitProfileState());

  static ProfileCubit get(context)=>BlocProvider.of(context);
UserModel? userModel;
  bool isName =false ;
  UpdateUserModel? updateUserModel;

  void getUser(){
    emit(GetUserDataLoading());
    DioHelper.getData(
        url: getCurrentUser,
        token: token,
    ).then((value) {
      userModel = UserModel.fromJson(value.data['data']);
     // print(value.data['data']);
      emit(GetUserDataSuccess());
    }).catchError((error){
      emit(GetUserDataError());
    });
  }

  Future<void> updateUserData({
   String? firstName,
   String? lastName,
   String? email,
})async{
    emit(UpdateUserDataLoading());
   await DioHelper.patchData(
        url: updateUser,
        token: token,
        data: {
          'firstName':'$firstName',
          'lastName':'$lastName',
          'email':'$email',
          'address':'dsutirk',
        }
    ).then((value){
      print('update user');
      updateUserModel = UpdateUserModel.fromJson(value.data);
      print(value.data);
      emit(UpdateUserDataSuccess());
    }).catchError((error){
      if(error is DioError){
        print('================${error.response}');
      }
      emit(UpdateUserDataError(error.toString()));
      print(error.toString());
    });
  }
}