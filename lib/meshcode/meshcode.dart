import 'package:apphomely/shared/styles/Styles.dart';
import 'package:flutter/material.dart';



class changePass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: PasswordScreen(),
    );
  }
}

class PasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.orange,
      //   title: Text('تعديل كلمة المرور'),
      //   leading: Icon(Icons.menu, color: Colors.black), // أيقونة القائمة
      // ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('تعديل كلمة المرور',style: TextStyle(
                  fontSize: 20.0,fontWeight: FontWeight.bold
                ),),
                Center(child: SizedBox(height:30.0 ,)),
                Text(

                  'كلمة المرور الحالية',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 10),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: ' كلمة المرور الحالية',
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'كلمة المرور الجديدة',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 10),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: ' كلمة المرور الجديدة',
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'تأكيد كلمة المرور',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 10),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'أعد إدخال كلمة المرور الجديدة',
                  ),
                ),
                SizedBox(height: 30),

                Container(
                  width: 150.0,
                  color:defaultColor ,
                  child: MaterialButton(
                    onPressed: () {
                      // إضافة الأكواد المرتبطة بالضغط على زر الحفظ هنا
                    },
                    child: Text('حفظ', style: TextStyle(color: Colors.white)),

                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


//--------------------------------------------------------------------------------------------

class knmklcml extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Account Settings',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AccountSettingsScreen(),
    );
  }
}

class AccountSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الاعدادات'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SettingsItem(
              icon: Icons.edit,
              label: 'تعديل الحساب',
              color: Colors.black,
            ),



            SettingsItem(
              icon: Icons.lock,
              label: 'تغيير كلمة المرور',
              color: Colors.black,
            ),



            SettingsItem(
              icon: Icons.delete,
              label: 'حذف الحساب',
              color: Colors.black,
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.orange,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('قائمة الخيارات'),
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
              ),
              ListTile(
                title: Text('الخيار 1'),
                onTap: () {
                  // Add your option 1 logic here
                },
              ),
              ListTile(
                title: Text('الخيار 2'),
                onTap: () {
                  // Add your option 2 logic here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const SettingsItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.orange),
      title: Text(label, style: TextStyle(color: color)),
      onTap: () {
        // Add your item logic here
      },
    );
  }
}