import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/omelt_model.dart';
import 'States_login_screen/registerStates.dart';

class HomelyRegisterCubit extends Cubit<HomelyRegisterStates>
{
  HomelyRegisterCubit():super(HomelyRegisterInitialState());

  static HomelyRegisterCubit get(context)=>BlocProvider.of(context);
   void userRegister({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String gender,
    required String password,
    required String city,
    required String cover,
    required String date,
    required String street,

}){
emit(HomelyRegisterLoadingState());
FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password
).then((value){

  print(value.user?.uid);
  print(value.user?.email);
  createUser(
    firstName: firstName,
    lastName: lastName,
    email: email,
    phone: phone,
    cover: cover,
    city:city ,
    street: street,
    date: date,
    gender: gender,
    password: password


  );
  emit(HomelyRegisterSuccessState());
}).catchError((e){
  emit(HomelyRegisterErrorState(e.toString()));
});
}
void createUser({
  required String firstName,
  required String lastName,
  required String email,
  required String gender,
  required String password,
  required String city,
  required String date,
  required String street,
  required String cover,
  required String phone,
}){
  homelyUsersModle model= homelyUsersModle(
    date: date,
    firstName: firstName,
    lastName: lastName,
    phone: phone,
    email: email,
    password: password,
    street: street,
    city: city,
    cover:cover,
    gender: gender,

  );
  FirebaseFirestore.instance
      .collection('users')
      .doc(firstName)
      .set(model.toMap())
      .then((value) {
    emit(HomelyCreateUseSuccessState());
  }).catchError((e) {
    emit(HomelyCreateUserErrorState(e.toString()));
  });
}





 IconData suffix= Icons.visibility_outlined;
 bool isPassword=true;
void ChangePassword(){
  isPassword=! isPassword;
  suffix=isPassword?Icons.visibility_outlined:Icons.visibility_off_outlined;
  emit(HomelyLoginChangePasswordState());
}

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
  }

