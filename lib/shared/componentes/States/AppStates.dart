abstract class HomelyStates{}
class HomelyInitialState extends HomelyStates{}
class HomelyBottomNaveState extends HomelyStates{}
class HomelyLoadingState extends HomelyStates{}
class HomelyGetUserSuccessState extends HomelyStates{}
class HomelyGetUserLoadingState extends HomelyStates{}
class HomelyGetUserErrorState extends HomelyStates{
  late final String error;
  HomelyGetUserErrorState(this.error);
}
