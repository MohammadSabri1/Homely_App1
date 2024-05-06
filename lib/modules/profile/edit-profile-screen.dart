import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class editProfileScreen extends StatelessWidget {
  const editProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         centerTitle: true,
         title: Text('تعديل الحساب',
         style: TextStyle(
           fontWeight: FontWeight.bold,
           fontSize: 18
         ),
         ),
       ),
      body:  Column(
        children: [
          Center(
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Container(
                  width: 120.0,
                  height: 120.0,
                  child: CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage(
                      'https://img.freepik.com/premium-photo/computer-programmer-digital-avatar-generative-ai_934475-9327.jpg?w=740',

                    ),
                  ),
                ),
                IconButton(
                    onPressed:
                    (){}, icon: Icon(Icons.camera_alt_outlined))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
