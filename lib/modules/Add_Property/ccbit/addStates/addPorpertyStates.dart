abstract class HomelyAddPropertyStates{}
class HomelyAddPropertyInitialState extends HomelyAddPropertyStates{}
class HomelyAddPropertyLoadingState extends HomelyAddPropertyStates{}
class HomelyAddPropertySuccessState extends HomelyAddPropertyStates{}
class HomelyAddPropertyErrorState extends HomelyAddPropertyStates{
  late final String error;
  HomelyAddPropertyErrorState(this.error);
}
// class HomelyAddPropertySuccessState extends HomelyAddPropertyStates{}
//
// class HomelyAddPropertyErrorState extends HomelyAddPropertyStates{
//   late final String error;
//   HomelyAddPropertyErrorState(this.error);
// }
