import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                height: 170.0,
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
                            SizedBox(width: 7.0,),
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

            ],
          ),
        ),
      ),
    );
  }
}
