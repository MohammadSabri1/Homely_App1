import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/home_screen.dart';
import '../../../modules/Add_Property/Add_propertiy.dart';
import '../../../modules/setting/setting_screen.dart';
import '../States/AppStates.dart';

class HomelyCubit extends Cubit<HomelyStates>
{
  HomelyCubit():super(HomelyInitialState());

  static HomelyCubit get(context)=>BlocProvider.of(context);
  List<Widget>Screens=[
    SettingScreen(),
    AddScreen(),
    Homely_Home(),
  ];

  int currentIndex=2;
  List<BottomNavigationBarItem>Bottomitem=[
    BottomNavigationBarItem(
        icon:Icon(Icons.settings),
        label: 'settings'
    ),
    BottomNavigationBarItem(
        icon:Icon(Icons.add_box_outlined),
        label: 'add'
    ),
    BottomNavigationBarItem(
        icon:Icon(Icons.home_outlined),
        label: 'home'
    ),
  ];
  void changeBottomBar(int index){
    currentIndex=index;
    emit(HomelyBottomNaveState());

  }

}