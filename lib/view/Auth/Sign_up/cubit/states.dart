abstract class SignupStates{}
class InitSignupState extends SignupStates{}

class SignupLoadingState extends SignupStates{}
class SignupSuccessState extends SignupStates{}
class SignupErrorState extends SignupStates{
  String? error;
  SignupErrorState(this.error);
}
