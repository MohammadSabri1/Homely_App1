import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../layout/test_home.dart';
import '../../../models/users_model.dart';
import '../../../shared/styles/icons.dart';
import '../../Add_Property/Add_propertiy.dart';
import '../../admin_home/admin_home-screen.dart';
import '../../profile/profile_screen.dart';
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

}
)
   {
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
    password: password,
      uid:value.user!.uid ,
  );
  getUserData();                    //////
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
  required String uid,
}){
  homelyUsersModle model= homelyUsersModle.homelyUsersModel(
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
    uid: uid,
    image:'https://img.freepik.com/premium-photo/computer-programmer-digital-avatar-generative-ai_934475-9327.jpg?w=740'

  );

  FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .set(model.toMap())
      .then((value) {

    emit(HomelyCreateUseSuccessState());
  }).catchError((e) {
    emit(HomelyCreateUserErrorState(e.toString()));
  });
}


  List<homelyUsersModle> listGetUser=[];

  Future<void> getUserData() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .orderBy('date', descending: true)
          .limit(1)
          .get();
      listGetUser.clear();

      if (querySnapshot.docs.isNotEmpty) {
        homelyUsersModle model = homelyUsersModle.fromMap(querySnapshot.docs[0]
            .data() as Map<String, dynamic>);
        listGetUser.add(model);
        print('Added user to list: ${model.firstName}');
      }

      emit(SuccesspublishUserState());
    } catch (e) {
      emit(ErrorpublishUserState());
    }
  }









  void SuggesAndComplain({
    required String uid,
    required String SuggesAndComplain,
  }) {
    if (uid.isEmpty) {
      // Handle the case where uid is empty
      emit(SuggesAndComplainModelUserIsEmptyState());
      return;
    }

    SuggestionsAndComplaintsModel SuggesAndComplainModel =
    SuggestionsAndComplaintsModel.SuggestionsAndComplaintsModel(
      SuggesAndComplain: SuggesAndComplain,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('complaints') // create a subcollection under the user's document
        .doc() // create a new document with a unique ID
        .set(SuggesAndComplainModel.toMap())
        .then((value) {
      emit(SuggesAndComplainModelUseSuccessState());
    }).catchError((e) {
      emit(SuggesAndComplainModelUserErrorState());
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






  List<Widget>Screens=[
    ProfileScreen(),
    AddScreen(),
    testHomeAddProperty(),
    adminHomeScreen()
  ];

  int currentIndex=2;
  List<BottomNavigationBarItem>Bottomitem=[
    BottomNavigationBarItem(
        icon:Icon(IconBroken.Profile),
        label: 'Profile'
    ),
    BottomNavigationBarItem(
        icon:Icon(IconBroken.Plus),
        label: 'add'
    ),
    BottomNavigationBarItem(
        icon:Icon(IconBroken.Home),
        label: 'home'
    ),
    BottomNavigationBarItem(
        icon:Icon(IconBroken.Paper_Download),
        label: 'add admin'
    ),
  ];
  void changeBottomBar(int index){
    currentIndex=index;
    emit(HomelyBottomNaveState());

  }
  }

