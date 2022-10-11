abstract class ProfileStates{}
class InitProfileState extends ProfileStates {}

class GetUserDataLoading extends ProfileStates {}
class GetUserDataSuccess extends ProfileStates {}
class GetUserDataError extends ProfileStates {}

class ToggleState extends ProfileStates {}

class UpdateUserDataLoading extends ProfileStates {}
class UpdateUserDataSuccess extends ProfileStates {}
class UpdateUserDataError extends ProfileStates {
  String error;
  UpdateUserDataError(this.error);
}
