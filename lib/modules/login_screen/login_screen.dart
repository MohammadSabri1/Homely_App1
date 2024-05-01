import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../layout/homeApp.dart';
import '../../layout/home_screen.dart';
import '../../models/test.dart';
import '../../shared/componentes/componetes.dart';
import '../register_screen/register_screen.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
       if(googleUser == null){
         return;
       }
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
     await FirebaseAuth.instance.signInWithCredential(credential);
     Navigator.pushReplacement(context,
        MaterialPageRoute(
            builder: (context) => Homely_Home())
    );
  }
  var formKey=GlobalKey<FormState>();
  TextEditingController UserController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  bool passShow=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تسجيل دخول',
          style:TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold
          ) ,
        ),
        centerTitle: true,
        actions: [],
      ),
      body:Center(
        child: ListView(
          children: [
            Form(
              key:formKey ,
              child:  Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultTextFormField(
                      controller: UserController,
                      type: TextInputType.emailAddress,
                      validator: (value){
                        if (value!.isEmpty){
                          return'اسم المستخدم غير صحيح';
                        }
                        return null;
                      },
                      label: 'اسم المستخدم',
                      prefixIcon: Icons.person_2_outlined,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultTextFormField(
                        controller: passwordController,
                        type: TextInputType.text,
                        validator: (value){
                          if (value!.isEmpty){
                            return'كلمة المرور غير صحيحه';
                          }
                        },
                        label: 'كلمة المرور',
                        prefixIcon: Icons.lock_outline,
                        suffix:passShow?Icons.visibility_off_outlined:Icons.visibility_outlined,
                        obscureText: passShow,
                        suffixPressed: () {
                          setState(() {
                            passShow = !passShow;
                          });
                        }),
                    SizedBox(
                      height: 0.0,
                    ),
                    TextButton(onPressed: (){

                    }, child:Text(
                        'هل نسيت كلمة المرور',
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.grey[500]
                      ),
                    )
                    ),
                    SizedBox(height: 10.0,),
                    defaultButton(
                        background: Colors.deepOrangeAccent,
                        function: ()async {
                          if (formKey.currentState!.validate()) {
                            try {
                              final credential = await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                  email: UserController.text,
                                  password: passwordController.text
                              );
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen())
                              );
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                print(
                                    '=====لم يتم العثور علي مستخدم لهذ الايميل======');
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  animType: AnimType.rightSlide,
                                  title: ' خطاء',
                                  desc: 'لم يتم العثور علي اسم مستخدم',
                                ).show();
                              } else if (e.code == 'wrong-password') {
                                print('======كلمه المرور غير صحيحه=======');
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  animType: AnimType.rightSlide,
                                  title: ' خطاء',
                                  desc: 'كلمه المرور غير صحيحه',
                                ).show();
                              }
                            }
                          }
                        } ,
                        text: 'تسجيل دخول'

                    ),
                    SizedBox(height: 20.0,),
                    defaultButton(
                        function: (){
                          signInWithGoogle();
                        }, text: 'تسجيل دخول جوجل'
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(onPressed: (){
                          navigatorTo(context, register());
                        }, child: Text('انشاء حساب'),
                        ),
                      ],
                    )

                  ],
                ),
              ),
            ),
          ],
        ),
      ) ,
    );
  }
}
