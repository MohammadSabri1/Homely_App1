import 'package:apphomely/layout/homeApp.dart';
import 'package:apphomely/shared/componentes/States/AppStates.dart';
import 'package:apphomely/shared/componentes/cubit/AppCubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'firebase_options.dart';
import 'interFace/welcome.dart';
import 'layout/home_screen.dart';
import 'layout/testHome.dart';
import 'models/test.dart';
import 'modules/Add_Property/Add_propertiy.dart';
import 'modules/admin_home/admin_home-screen.dart';
import 'modules/admin_home/cubit/admin_cubit.dart';
import 'modules/login_screen/login_screen.dart';
import 'modules/profile/profile_screen.dart';
import 'modules/register_screen/cubit_reisster/registerCubit.dart';
import 'modules/search/search_screen.dart';

 void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // await cacheHelper.init();
  // Widget widget;
  //  uid = cacheHelper.getData(key: 'uid') ;
  // if(uid != null){
  //   widget = HomeScreen();
  // }else{
  //   widget=LoginScreen();
  // }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('============= !تم تسجبل خروج=======');
      } else {
        print('============= تم تسجيل دخول!=======');
      }
    });
    super.initState();
  }
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(
          create: (BuildContext context) => HomelyCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => AdmainAddPropertyCubit()..getDataProperty(),
        ),
        BlocProvider<HomelyRegisterCubit>(
          create: (context) => HomelyRegisterCubit()..getUserData(),
        ),
      ],
      child: BlocConsumer<HomelyCubit, HomelyStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return  MaterialApp(
            theme:ThemeData(
              fontFamily: 'Cairo_font',
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.teal,
                backgroundColor: Colors.grey[100],
                elevation: 20.0,
              ),
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  //uptate bar tiem
                ),

                color: Colors.white,
                elevation: 0.0,
              ),
            ),
            darkTheme:ThemeData(
              scaffoldBackgroundColor:HexColor('333739'),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                backgroundColor: Colors.grey[100],
                elevation: 20.0,
              ),
              appBarTheme: AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(

                ),

                color: Colors.white,
                elevation: 0.0,
              ),
            ) ,
            debugShowCheckedModeBanner: false,
            home:HomeScreen(),

            //  FirebaseAuth.instance.currentUser==null? LoginScreen():HomeScreen(),
          );
        },
      ),
    );
  }
}
