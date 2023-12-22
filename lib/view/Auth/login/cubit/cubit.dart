import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_app/core/network/dio_helper.dart';
import 'package:plants_app/core/network/end_point.dart';
import 'package:plants_app/models/login_model.dart';
import 'package:plants_app/view/Auth/login/cubit/state.dart';


class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(InitLoginState());
  static LoginCubit get(context)=> BlocProvider.of(context);
   LoginModel? loginModel;
  Future loginUser({
  required String email,
  required String password,
})async{
    emit(LoginLoadingState());
   await DioHelper.postData(
        url:login ,
        data:
        {
          'password':password,
          'email':email,
        }
    ).then((value){
     print('================= success');
     print(value.data);
      loginModel = LoginModel.fromJson(value.data);
      emit(LoginSuccessState());
    }).catchError((error){
      if(error is DioError){
        print(error.response!.data['message'].toString());
        emit(LoginErrorState(error.response!.data['message'].toString()));
      }
    });
  }
}