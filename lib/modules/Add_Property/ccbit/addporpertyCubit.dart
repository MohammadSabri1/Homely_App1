import 'package:apphomely/modules/Add_Property/ccbit/addStates/addPorpertyStates.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/add_proprte/add_property_model.dart';
class HomelyAddPropertyCubit extends Cubit<HomelyAddPropertyStates> {
  HomelyAddPropertyCubit() :super(HomelyAddPropertyInitialState());
  static HomelyAddPropertyCubit get(context)=>BlocProvider.of(context);
  List<String> governorates = [
    "القاهرة",
    "الجيزة",
    "الإسكندرية",
    "الشرقية",
    "الدقهلية",
    "القليوبية",
    "المنوفية",
    "الغربية",
    "البحيرة",
    "سوهاج",
    "قنا",
    "الأقصر",
    "أسوان",
    "المنيا",
    "الأسيوط",
    "سويف",
    "البحر الأحمر",
    "الفيوم",
    "الوادي الجديد",
    "شمال سيناء",
    "جنوب سيناء",
    "بورسعيد",
    "الإسماعيلية",
    "السويس",
  ];
  List<String> RomNum=[
    '1','2','3','4','5','6','اكثر '
  ];
  List<String> roleProperty=[
    '1','2','3','4','5','6','اكثر ',
    'شاليه',"منزل","فيلا"
  ];
  List<String> propertyViews = [
    "إطلالة على البحر مباشرة",
    "صف ثاني على البحر",
    "صف ثالث على البحر",
    "إطلالة جزئية على البحر",
    "إطلالة على مجمع تجاري",
    "إطلالة على شارع مباشر",
    "إطلالة على شارع فرعي",
    "إطلالة على الحديقة",
    "إطلالة على شارع راقي",
    "إطلالة على معلم تاريخي",
    "إطلالة على ساحة عامة",
    "إطلالة على منطقة تجارية",
    "إطلالة على ملعب رياضي",
    "إطلالة على بحيرة",
    "إطلالة على شلال",
  ];


  void addPropert({
   required String floor,
    required String space,
    required String view,
    required String pathRom,
    required String rom,
    required  String price,
    required  String city,
    required String cover,
    required String street,
    required String detail,
    required  String person,
  }) {
    AddPorpertyModle model = AddPorpertyModle(

      cover: cover,
      city: city,
      street: street,
      price: price,
      rom: rom,
      pathRom: pathRom,
      view: view,
      space: space,
        person: person,
        floor: floor,
      detail: detail

    );
    FirebaseFirestore.instance
        .collection('Add Property')
        .doc(city)
        .set(model.toMap())
        .then((value) {
      emit(HomelyAddPropertySuccessState());
    }).catchError((e) {
      emit(HomelyAddPropertyErrorState(e.toString()));
    });
  }
}