import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_app/models/signup_model.dart';
import 'package:plants_app/network/dio_helper.dart';
import 'package:plants_app/view/Auth/Sign_up/cubit/states.dart';
import '../../../../network/end_point.dart';

class SignupCubit extends Cubit<SignupStates> {
  SignupCubit() :  super(InitSignupState());
  static SignupCubit get(context)=> BlocProvider.of(context);
   SignupModel? signupModel;
  Future signUp({
  required String firstName,
  required String lastName,
  required String email,
  required String password,
})async{
    emit(SignupLoadingState());
  await DioHelper.postData(
        url:signup,
        data:{
         'firstName':firstName,
         'lastName':lastName,
         'email':email,
         'password':password,
        },
    ).then((value){
    print('done');
      signupModel = SignupModel.fromJson(value.data);
      print(value.data);
      print(signupModel!.message!);
      print('success');
      emit(SignupSuccessState());
    }).catchError((error){
      if(error is DioError){
        print('error when signup ${error.response!.data['message'].toString()}');
        emit(SignupErrorState(error.response!.data['message'].toString()));
      }
    });
  }
}