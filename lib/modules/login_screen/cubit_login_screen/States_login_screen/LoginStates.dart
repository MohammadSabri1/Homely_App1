abstract class HomelyLoginStates{}
class HomelyLoginInitialState extends HomelyLoginStates{}
class HomelyLoginLoadingState extends HomelyLoginStates{}
class HomelyLoginSuccessState extends HomelyLoginStates
{
   final String uid;

  HomelyLoginSuccessState(this.uid);
}
class HomelyLoginErrorState extends HomelyLoginStates{
  late final String error;
  HomelyLoginErrorState(this.error);
}
class HomelyLoginChangePasswordState extends HomelyLoginStates{}
