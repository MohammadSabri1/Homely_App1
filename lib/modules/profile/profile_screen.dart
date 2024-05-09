import 'package:apphomely/modules/profile/edit-profile-screen.dart';
import 'package:apphomely/shared/componentes/States/AppStates.dart';
import 'package:apphomely/shared/componentes/cubit/AppCubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../shared/componentes/componetes.dart';
import '../login_screen/login_screen.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomelyCubit,HomelyStates>(
     listener: (BuildContext context, HomelyStates state)
     {

     },
      builder: (BuildContext context, HomelyStates state)
      {
        // var userModel= HomelyCubit.get(context).Model;
        return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  child: CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage(
                      'https://img.freepik.com/premium-photo/computer-programmer-digital-avatar-generative-ai_934475-9327.jpg?w=740',

                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Text('mohamed sabry',
                  style: TextStyle(fontSize: 20,
                  ),
                ),
                SizedBox(height: 8,),
                Text('mohamedsabry@gmail.com',
                  style: TextStyle(fontSize: 16,
                      color: Colors.grey
                  ),
                ),
                SizedBox(height: 20.0,),
                Container(
                  width: double.infinity,
                  height: 220.0,
                  child: Card(
                    color: Colors.grey[100],
                    child:
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('القاهره',
                            style: TextStyle(fontSize: 18.0,

                            ),
                          ),
                          SizedBox(height: 15.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('السوبر القديم',
                                style: TextStyle(fontSize: 18.0,

                                ),
                              ),
                              Text(' - ',
                                style: TextStyle(fontSize: 18.0,

                                ),
                              ),
                              Text('الشروق',
                                style: TextStyle(fontSize: 18.0,

                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.0,),
                          Text('+201014856391',
                            style: TextStyle(fontSize: 18.0,

                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton.outlined(
                                  onPressed:(){
                                    navigatorTo(context, editProfileScreen());
                                  }, icon: Icon(Icons.edit)
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                ),
                SizedBox(height: 20.0,),
                Container(
                  color: Colors.black,
                  width: double.infinity,
                  height: 1.0,
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      onPressed:(){
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Column(
                                  children: [
                                    Text(
                                        'سوف يتم الواصل معك قريبا'
                                    ),
                                    SizedBox(height: 8.0,),
                                    Text(
                                        "شكرا لستخدامك Homely "
                                    ),
                                  ],
                                )
                            )
                        );
                      },child: Text('طلب الغاء الايجار',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                    ),
                    Icon(Icons.cancel_outlined)
                  ],
                ),
                // SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      onPressed:(){
                        showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                title:Icon(Icons.warning),
                                content: Text('هل تريد تسجيل خروج'),
                                actions: [
                                  TextButton(onPressed: (){
                                    Navigator.pop(context);
                                  },child:Text('لا') ),
                                  TextButton(onPressed:()async{
                                    GoogleSignIn googleSignIn=GoogleSignIn();
                                    googleSignIn.disconnect();
                                    await FirebaseAuth.instance.signOut();
                                    navigatorTo(context, LoginScreen());
                                  },child:Text('نعم'),),

                                ],
                              );
                            }
                        );
                      },child: Text('تسجيل خروج',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                    ),
                    Icon(Icons.login_outlined)
                  ],
                ),
                // SizedBox(height: 16.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      onPressed:(){
                        showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                title:Icon(Icons.warning),
                                content: Text('هل تريد حذف الحساب'),
                                actions: [
                                  TextButton(onPressed: (){
                                    Navigator.pop(context);
                                  },child:Text('لا') ),
                                  TextButton(onPressed: (){},child:Text('نعم'),),

                                ],
                              );
                            }
                        );
                      },child: Text('حذف الحساب',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                    ),
                    Icon(Icons.delete_outline_outlined)
                  ],
                ),

              ],
            ),
          ),
        ),
      );
      }


    );
  }
}
