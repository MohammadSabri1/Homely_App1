import 'dart:io';

import 'package:apphomely/shared/styles/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import '../../../layout/home_screen.dart';
import '../../../models/omelt_model.dart';
import '../../../modules/Add_Property/Add_propertiy.dart';
import '../../../modules/profile/profile_screen.dart';
import '../States/AppStates.dart';

class HomelyCubit extends Cubit<HomelyStates>
{
  HomelyCubit():super(HomelyInitialState());

  static HomelyCubit get(context)=>BlocProvider.of(context);
  List<Widget>Screens=[
    profileScreen(),
    AddScreen(),
    Homely_Home(),
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
  ];
  void changeBottomBar(int index){
    currentIndex=index;
    emit(HomelyBottomNaveState());

  }
  homelyUsersModle? Model ;

  // void getUserDada(){
  //   emit(HomelyGetUserLoadingState());
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(uid)
  //       .get()
  //       .then((value){
  //         // value.data()
  //     print(value.data());
  //     Model=homelyUsersModle.formJson(value.data()! );
  //     emit(HomelyGetUserSuccessState());
  //
  //     print('=============heloo');
  //
  //   }).catchError((error){
  //     print(error.toString());
  //     emit(HomelyGetUserErrorState(error.toString()));
  //   }
  //   );
  // }
  File? imageProfile ;
  var picker =ImagePicker();
  Future <void>changeProfileImage()async{
    final pickfile =await picker.pickImage(source: ImageSource.gallery);
    if(pickfile!=null){
      imageProfile=File(pickfile.path);
      emit(HomelyGetProfileImageSuccessState());
    }else{
      print('لم يتم تحديد صوره');
      emit(HomelyGetProfileImageErrorState());
    }

  }

  Widget SmoothStar() {
    return RatingBar.builder(
      initialRating: 3,
      itemCount: 5,
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return Icon(
              Icons.sentiment_very_dissatisfied,
              color: Colors.red,
            );
          case 1:
            return Icon(
              Icons.sentiment_dissatisfied,
              color: Colors.redAccent,
            );
          case 2:
            return Icon(
              Icons.sentiment_neutral,
              color: Colors.amber,
            );
          case 3:
            return Icon(
              Icons.sentiment_satisfied,
              color: Colors.lightGreen,
            );
          case 4:
            return Icon(
              Icons.sentiment_very_satisfied,
              color: Colors.green,
            );
          default:
            return Container(); // يمكن استبدال هذا بعنصر واجهة مختلف إذا لزم الأمر
        }
      },
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }

}
