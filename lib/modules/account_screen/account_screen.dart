import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(

        child: Column(
          children:<Widget> [
            DrawerHeader(child: CircleAvatar()),

          ],
        ),
      ),
    );
  }
}