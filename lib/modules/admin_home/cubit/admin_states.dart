abstract class amainAddPropertyStates{}
class amainAddPropertyInitialState extends amainAddPropertyStates{}
class amainAddPropertyLoadingState extends amainAddPropertyStates{}
class amainAddPropertySuccessState extends amainAddPropertyStates{}
class amainAddPropertyErrorState extends amainAddPropertyStates{
  late final String error;
  amainAddPropertyErrorState(this.error);
}
// class HomelyAddPropertySuccessState extends HomelyAddPropertyStates{}
//
// class HomelyAddPropertyErrorState extends HomelyAddPropertyStates{
//   late final String error;
//   HomelyAddPropertyErrorState(this.error);
// }
class amainAddPropertyImageSuccessState extends amainAddPropertyStates{}
class amainAddPropertyImageErrorState extends amainAddPropertyStates{}
class amainSelectPropertyImageSuccessState extends amainAddPropertyStates{}
class amainAddPropertyImageLoadingState extends amainAddPropertyStates{}