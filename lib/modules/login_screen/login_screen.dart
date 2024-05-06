import 'package:apphomely/modules/login_screen/cubit_login_screen/LoginCubit.dart';
import 'package:apphomely/modules/login_screen/cubit_login_screen/States_login_screen/LoginStates.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.pushReplacement(context,
        MaterialPageRoute(
            builder: (context) => HomeScreen())
    );
  }
  var formKey=GlobalKey<FormState>();
  TextEditingController UserController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  bool passShow=true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>HomelyLoginCubit(),
      child:BlocConsumer<HomelyLoginCubit,HomelyLoginStates>(
        listener: ( context,  state) {
          if(state is HomelyLoginErrorState){
            showToast(
                text: state.error,
                state: toastState.error
            );
            // AwesomeDialog(
            //   context: context,
            //   dialogType: DialogType.error,
            //   animType: AnimType.rightSlide,
            //   title: ' خطاء',
            //   desc: 'لم يتم العثور علي المستخدم',
            // ).show();
          }
          if (state is HomelyLoginSuccessState) {
            pushAndRemoveUntil(context, HomeScreen());
          }
        },
        builder: (BuildContext context, state) { return Scaffold(
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
                              return null;
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
                          height: 20.0,
                        ),
                        SizedBox(height: 10.0,),
                        ConditionalBuilder(
                            condition: state is! HomelyLoginLoadingState,
                            builder: (context)=>Center(
                              child: defaultButton(
                                  width:150.0,
                                  function: (){
                                    if(formKey.currentState!.validate() )
                                    {
                                      HomelyLoginCubit.get(context).userLogin(
                                          email:UserController.text ,
                                          password: passwordController.text
                                      );

                                    }
                                  },
                                  text: 'تسجيل دخول'),
                            ),
                            fallback: (context)=>Center(child: CircularProgressIndicator(),)
                        ),
                        // defaultButton(
                        //     background: Colors.deepOrangeAccent,
                        //     function: ()async {
                        //       if (formKey.currentState!.validate()) {
                        //         try {
                        //           final credential = await FirebaseAuth.instance
                        //               .signInWithEmailAndPassword(
                        //               email: UserController.text,
                        //               password: passwordController.text
                        //           );
                        //           Navigator.pushReplacement(context,
                        //               MaterialPageRoute(
                        //                   builder: (context) => HomeScreen())
                        //           );
                        //         } on FirebaseAuthException catch (e) {
                        //           if (e.code == 'user-not-found') {
                        //             AwesomeDialog(
                        //               context: context,
                        //               dialogType: DialogType.error,
                        //               animType: AnimType.rightSlide,
                        //               title: ' خطاء',
                        //               desc: 'لم يتم العثور علي اسم مستخدم',
                        //             ).show();
                        //             print(
                        //                 '=====لم يتم العثور علي مستخدم لهذ الايميل======');
                        //
                        //           } else if (e.code == 'wrong-password') {
                        //             AwesomeDialog(
                        //               context: context,
                        //               dialogType: DialogType.error,
                        //               animType: AnimType.rightSlide,
                        //               title: ' خطاء',
                        //               desc: 'كلمه المرور غير صحيحه',
                        //             ).show();
                        //             print('======كلمه المرور غير صحيحه=======');
                        //           }
                        //         }
                        //       }
                        //     } ,
                        //     text: 'تسجيل دخول'
                        //
                        // ),
                        SizedBox(height: 20.0,),
                        Center(
                          child: MaterialButton(
                            onPressed: (){
                              signInWithGoogle();
                            },child:Image.asset(
                            'assets/imdegoogle.png',
                            height: 30.0,
                            width: 30,
                          ) ,
                          ),
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
        },

      ),
    );
  }
}
