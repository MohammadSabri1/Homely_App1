
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'States_login_screen/LoginStates.dart';

class HomelyLoginCubit extends Cubit<HomelyLoginStates>
{
  HomelyLoginCubit():super(HomelyLoginInitialState());

  static HomelyLoginCubit get(context)=>BlocProvider.of(context);
 IconData suffix= Icons.visibility_outlined;
 bool isPassword=true;
void ChangePassword(){
  isPassword=! isPassword;
  suffix=isPassword?Icons.visibility_outlined:Icons.visibility_off_outlined;
  emit(HomelyLoginLoadingState());
}


  }

