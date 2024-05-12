import 'package:apphomely/modules/login_screen/login_screen.dart';
import 'package:apphomely/shared/componentes/componetes.dart';
import 'package:apphomely/shared/styles/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../modules/login_screen/login-admin/login-Admin_screen.dart';

class welcome extends StatelessWidget {
  const welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      // appBar: AppBar(),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Homely مرحبا بك في',
                  style:TextStyle(fontSize: 18.0,
                  fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 15.0,),
                Text('سجل دخول الان',
                  style:TextStyle(fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    color: Colors.grey
                  ),
                ),
                SizedBox(height: 100.0,),
              MaterialButton(
                onPressed: (){
                  navigatorTo(context, LoginScreen());
          
                },child:Image.asset(
                'assets/user.png',
                height: 120.0,
                width: 120,
              ) ,
              ),
              SizedBox(height: 15.0,),
                Text('مستخدم',
                  style:TextStyle(fontSize: 14.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              SizedBox(height: 100.0,),
              MaterialButton(
                onPressed: (){
                  navigatorTo(context, LoginAdminScreen());
                },child:Image.asset(
                'assets/admin2.png',
                height: 120.0,
                width: 120,
              ) ,
              ),
                SizedBox(height: 15.0,),
          
                Text('مشرف',
                  style:TextStyle(fontSize: 14.0,
                      fontWeight: FontWeight.bold
                  ),
                ),

                SizedBox(height: 15.0,),
                   InkWell(
                     onTap: (){},
                     child: Container(
                       width: 120,
                       height: 120,
                       decoration: BoxDecoration(
                           color: Colors.deepOrange,
                         borderRadius: BorderRadius.circular(50.0),
                       ),
                       child: Icon(
                         IconBroken.Profile,size: 60.0,color: Colors.white,
                       ),

                     ),
                   ),
                SizedBox(height: 15.0,),
                Text('مستخدم',
                  style:TextStyle(fontSize: 14.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
