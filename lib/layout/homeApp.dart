import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../modules/search/search_screen.dart';
import '../modules/login_screen/login_screen.dart';
import '../shared/componentes/States/AppStates.dart';
import '../shared/componentes/componetes.dart';
import '../shared/componentes/cubit/AppCubit.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController UserController =TextEditingController();
  var formKey=GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomelyCubit, HomelyStates>(
        listener: ( BuildContext context, HomelyStates state)
    {},
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
    icon: Icon(Icons.settings_outlined),),
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
    backgroundColor: Colors.grey[100],
    child: Column(
    children:<Widget> [
    DrawerHeader(child:
    CircleAvatar(
    radius: 100,
    backgroundImage: AssetImage('assets/homely logo.png'),
    ),
    ),
    SizedBox(height:10.0,),
    Padding(
    padding: const EdgeInsets.all(25.0),
    child: Column(
    crossAxisAlignment:CrossAxisAlignment.end,
    children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
    MaterialButton(
    onPressed:(){
    },child: Text('وضع اليلي',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16
    ),
    ),
    ),
    Icon(Icons.mode_night_outlined)
    ],
    ),
    SizedBox(height: 16,),
    Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
    MaterialButton(
    onPressed:(){
    },child: Text('تغير اللغه',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16
    ),
    ),
    ),
    Icon(Icons.language_outlined)
    ],
    ),
    SizedBox(height: 16,),
    Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
    MaterialButton(
    onPressed:(){

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height:200.0 ,
            color: Colors.grey[150],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon:Icon(Icons.done),
                      ),

                      Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon:Icon(Icons.close),
                      ),
                    ],
                  ),
                  Center(
                    child: Text(
                      'تواصل معنا',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('+201223570789',
                            style:TextStyle(
                              fontSize: 16.0
                            ) ,),
                          SizedBox(width: 10.0,),
                          Icon(Icons.call)
                        ],
                      )
                ],
              ),
            ),

          );
        },
      );
    },child: Text('تواصل معنا',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16
    ),
    ),
    ),
    Icon(Icons.call)
    ],
    ),
    SizedBox(height: 16,),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MaterialButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: MediaQuery.of(context).size.height ,
                    color: Colors.grey[150],
                    child: Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon:Icon(Icons.done),
                                ),

                                Spacer(),
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon:Icon(Icons.close),
                                ),
                              ],
                            ),
                            Center(
                              child: Text(
                                'مقترحات و شكوي ',
                                style: TextStyle(
                                    fontSize: 18.0,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0,),
                            defaultTextFormField(
                              controller: UserController,
                              type: TextInputType.emailAddress,
                              validator: (value){
                                if (value!.isEmpty){
                                  return'فارغ من فضلك اكتب';
                                }
                                return null;
                              },
                              label: 'مقترحات و شكوي',
                              prefixIcon: Icons.local_post_office_outlined,
                            ),
                          ],
                        ),
                      ),
                    ),

                  );
                },
              );
            },
            child: Text(
              'مقترحات و شكوي',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Icon(Icons.local_post_office_outlined),
        ],
      ),
      SizedBox(height: 16,),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MaterialButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(

                    title: Text('تقييم التطبيق'),
                    content:

                    RatingBar.builder(
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
                              return Container();
                          }
                        },
                        onRatingUpdate: (rating) {
                          print(rating);
                           },
                    ),
                    // RatingBar.builder(
                    //   initialRating: 3,
                    //   minRating: 1,
                    //   direction: Axis.horizontal,
                    //   allowHalfRating: true,
                    //   itemCount: 5,
                    //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    //   itemBuilder: (context, _) => Icon(
                    //     Icons.star,
                    //     color: Colors.deepOrange,
                    //   ),
                    //   onRatingUpdate: (rating) {
                    //     print(rating);
                    //   },
                    // ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('ارسال'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text(
              'التقييم',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Icon(Icons.star_border_outlined)
        ],
      ),

      SizedBox(height: 16,),
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
    SizedBox(height: 16.0,),
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
    )
    ],
    ),
    ),

    );
    }
    );

    }
  }


