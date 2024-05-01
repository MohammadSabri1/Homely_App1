abstract class HomelyRegisterStates{}
class HomelyRegisterInitialState extends HomelyRegisterStates{}
class HomelyRegisterLoadingState extends HomelyRegisterStates{}
class HomelyRegisterSuccessState extends HomelyRegisterStates{}
class HomelyRegisterErrorState extends HomelyRegisterStates{
  late final String error;
  HomelyRegisterErrorState(this.error);
}
class HomelyCreateUseSuccessState extends HomelyRegisterStates{}

class HomelyCreateUserErrorState extends HomelyRegisterStates{
  late final String error;
  HomelyCreateUserErrorState(this.error);
}
class HomelyLoginChangePasswordState extends HomelyRegisterStates{}
