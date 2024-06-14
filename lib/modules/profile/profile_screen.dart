import 'package:apphomely/modules/profile/edit-profile-screen.dart';
import 'package:apphomely/shared/componentes/States/AppStates.dart';
import 'package:apphomely/shared/componentes/cubit/AppCubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../models/users_model.dart';
import '../../shared/componentes/componetes.dart';
import '../../shared/styles/icons.dart';
import '../login_screen/login_screen.dart';
import '../register_screen/cubit_reisster/States_login_screen/registerStates.dart';
import '../register_screen/cubit_reisster/registerCubit.dart';
class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = HomelyRegisterCubit.get(context);
    cubit.getUserData();
    return BlocConsumer<HomelyRegisterCubit, HomelyRegisterStates>(
      listener: (BuildContext context, HomelyRegisterStates state) {

      },
      builder: (BuildContext context, HomelyRegisterStates state) {
        if (state is SuccesspublishUserState) {
          if (cubit.listGetUser.isEmpty) {
            return Center(child: Text("لا توجد معلومات مستخدم متاحة"));
          } else {
             return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: double.infinity,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: cubit.listGetUser.length,
                    itemBuilder: (BuildContext context, i) {
                      homelyUsersModle user = cubit.listGetUser[i];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 100.0,
                            height: 100.0,
                            child: CircleAvatar(
                              radius: 25.0,
                              backgroundImage: NetworkImage(
                                  user.image ?? ''
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(cubit.listGetUser[i].lastName ?? '',
                                style: TextStyle(fontSize: 20,
                                ),
                              ),
                              SizedBox(width: 3.0,),
                              Text(cubit.listGetUser[i].firstName ?? '',
                                style: TextStyle(fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8,),
                          Text(user.email ?? '',
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
                                    Text(user.cover ?? '',
                                      style: TextStyle(fontSize: 18.0,

                                      ),
                                    ),
                                    SizedBox(height: 15.0,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(user.city ?? '',
                                          style: TextStyle(fontSize: 18.0,

                                          ),
                                        ),
                                        Text(' - ',
                                          style: TextStyle(fontSize: 18.0,

                                          ),
                                        ),
                                        Text(user.street ?? '',
                                          style: TextStyle(fontSize: 18.0,

                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15.0,),
                                    Text(user.phone ?? '',
                                      style: TextStyle(fontSize: 18.0,

                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        IconButton.outlined(
                                            onPressed: () {
                                              navigatorTo(
                                                  context, editProfileScreen());
                                            }, icon: Icon(IconBroken.Edit)
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
                                onPressed: () {
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
                                }, child: Text('طلب الغاء الايجار',
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
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Icon(Icons.warning),
                                          content: Text('هل تريد تسجيل خروج'),
                                          actions: [
                                            TextButton(onPressed: () {
                                              Navigator.pop(context);
                                            }, child: Text('لا')),
                                            TextButton(onPressed: () async {
                                              GoogleSignIn googleSignIn = GoogleSignIn();
                                              googleSignIn.disconnect();
                                              await FirebaseAuth.instance
                                                  .signOut();
                                              pushAndRemoveUntil(
                                                  context, LoginScreen());
                                            }, child: Text('نعم'),),

                                          ],
                                        );
                                      }
                                  );
                                }, child: Text('تسجيل خروج',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                ),
                              ),
                              ),
                              Icon(IconBroken.Logout)
                            ],
                          ),
                          // SizedBox(height: 16.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Icon(Icons.warning),
                                          content: Text('هل تريد حذف الحساب'),
                                          actions: [
                                            TextButton(onPressed: () {
                                              Navigator.pop(context);
                                            }, child: Text('لا')),
                                            TextButton(
                                              onPressed: () async {
                                                pushAndRemoveUntil(context, LoginScreen());
                                              },
                                              child: Text('نعم'),),

                                          ],
                                        );
                                      }
                                  );
                                }, child: Text('حذف الحساب',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                ),
                              ),
                              ),
                              Icon(IconBroken.Delete)
                            ],
                          ),

                        ],
                      );
                    },
                  ),
                ),
              ),
            );
          }

        } else {
          return Center(child: CircularProgressIndicator());
        }
      }
    );
  }

}