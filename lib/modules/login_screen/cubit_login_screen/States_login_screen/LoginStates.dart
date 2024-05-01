abstract class HomelyLoginStates{}
class HomelyLoginInitialState extends HomelyLoginStates{}
class HomelyLoginLoadingState extends HomelyLoginStates{}
class HomelyLoginSuccessState extends HomelyLoginStates{}
class HomelyLoginErrorState extends HomelyLoginStates{
  late final String error;
  HomelyLoginErrorState(this.error);
}
class HomelyLoginChangePasswordState extends HomelyLoginStates{}
