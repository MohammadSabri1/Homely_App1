abstract class admainAddPropertyStates{}
class amainAddPropertyInitialState extends admainAddPropertyStates{}
class amainAddPropertyLoadingState extends admainAddPropertyStates{}
class amainAddPropertySuccessState extends admainAddPropertyStates{}
class amainAddPropertyErrorState extends admainAddPropertyStates{
  late final String error;
  amainAddPropertyErrorState(this.error);
}
// class HomelyAddPropertySuccessState extends HomelyAddPropertyStates{}
//
// class HomelyAddPropertyErrorState extends HomelyAddPropertyStates{
//   late final String error;
//   HomelyAddPropertyErrorState(this.error);
// }
class amainAddPropertyImageSuccessState extends admainAddPropertyStates{}
class amainAddPropertyImageErrorState extends admainAddPropertyStates{}
class amainSelectPropertyImageSuccessState extends admainAddPropertyStates{}
class amainAddPropertyImageLoadingState extends admainAddPropertyStates{}
class amainAddPropertySuccesspublishState extends admainAddPropertyStates{}
class amainAddPropertyErrorpublishState extends admainAddPropertyStates{}
class AddPropertyreFreshDataState extends admainAddPropertyStates{}