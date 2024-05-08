import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class adminHomeScreen extends StatelessWidget {
  const adminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text('welcom Admin'),
      ),
      body: Column(children: [
        Text('welcome')
      ],),
    );
  }
}
