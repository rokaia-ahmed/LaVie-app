abstract class LoginStates{}
class InitLoginState extends LoginStates{}

class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{}
class LoginErrorState extends LoginStates{
  String error;
  LoginErrorState(this.error);
}
