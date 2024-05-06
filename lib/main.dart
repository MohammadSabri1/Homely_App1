import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'firebase_options.dart';
import 'layout/homeApp.dart';
import 'models/test.dart';
import 'modules/account_screen/account_screen.dart';
import 'modules/login_screen/login_screen.dart';
import 'modules/register_screen/register_screen.dart';
import 'modules/setting/profile_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
    return MaterialApp(
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
      debugShowCheckedModeBanner: false,
      home:HomeScreen(),
      //  FirebaseAuth.instance.currentUser==null? LoginScreen():HomeScreen(),
    );
  }
}
