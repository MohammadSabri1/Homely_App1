import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../modules/search/search_screen.dart';
import '../meshcode/meshcode.dart';
import '../modules/login_screen/login_screen.dart';
import '../shared/componentes/States/AppStates.dart';
import '../shared/componentes/componetes.dart';
import '../shared/componentes/cubit/AppCubit.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen ({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> HomelyCubit (),
      child: BlocConsumer<HomelyCubit,HomelyStates>(
          listener: ( BuildContext context,HomelyStates state){},
          builder: (BuildContext context,HomelyStates state)
          {
            var cubit=HomelyCubit.get(context);
            return Scaffold(
              appBar:AppBar(
                title: Text('Homely App'),
                centerTitle: true,
                leading:Builder(
                  builder: (context)=>IconButton(

                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: Icon(Icons.person),),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>SearchScreen()));
                    },
                    icon: Icon(Icons.search),
                  )],
              ) ,
              body:cubit.Screens[cubit.currentIndex],
              bottomNavigationBar:BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                items:cubit.Bottomitem,
                selectedItemColor: Colors.orangeAccent,
                onTap:(index) {
                  cubit.changeBottomBar(index);
                },
              ) ,
              drawer: Drawer(

                child: Column(
                  children:<Widget> [
                    DrawerHeader(child: CircleAvatar()
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment:CrossAxisAlignment.end,
                      children: [
                        MaterialButton(
                            onPressed:()async{
                               GoogleSignIn googleSignIn=GoogleSignIn();
                               googleSignIn.disconnect();
                              await FirebaseAuth.instance.signOut();
                              navigatorTo(context, LoginScreen());
                            },child: Text('تسجيل خروج'),
                        ),
                        SizedBox(height: 20.0,),
                        MaterialButton(
                            onPressed:(){
                              navigatorTo(context, changePass());
                            },child: Text('تغير كلمه المرور'),
                        ),
                        MaterialButton(
                            onPressed:(){
                              navigatorTo(context, changePass());
                            },child: Text('تغير كلمه المرور'),
                        ),
                      ],
                    )
                  ],
                ),
              ),

            );
          }
      ),
    );
  }
}
