import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import '../shared/styles/Styles.dart';

class Homely_Home extends StatefulWidget {
  Homely_Home({super.key});

  @override
  State<Homely_Home> createState() => _Homely_HomeState();
}

class _Homely_HomeState extends State<Homely_Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                child: Image(image: AssetImage('assets/shale2.jpeg')),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Text(
                    'منذ يومين',
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'شقه',
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                '8000 ج.م/شهر',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    ' مدينه واصل كمبوندات الشروق مدينة الشروق القاهرة',
                    style: TextStyle(
                      fontSize: 10.0,
                    ),
                  ),
                  Icon(
                    Icons.location_on_outlined,
                    size: 15,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 150.0,
                    decoration: const BoxDecoration(
                      color: defaultColor,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: TextButton(
                        onPressed: () {
                          WhatsApp(context: context);
                          setState(() {});
                        },
                        child: Icon(
                          Icons.chat,
                          color: Colors.white,
                        )),
                  ),
                  Container(
                    width: 150.0,
                    decoration: const BoxDecoration(
                      color: defaultColor,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: TextButton(
                        onPressed: () {
                        },
                        child: Icon(
                          Icons.call,
                          color: Colors.white,
                        )),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

// String phone='+201014856391';
Future<void> WhatsApp({
  String phone = '+201014856391',
  String message = 'مرحبا تطبيق homely يرحب بك. كيف استطيع ان اساعدك؟',
  required BuildContext context,
}) async {
  // Function to construct the appropriate WhatsApp URI based on platform
  Uri getWhatsappUri() {
    if (Platform.isAndroid) {
      return Uri.parse(
          'whatsapp://com.whatsapp/wa.me/$phone/?text=${Uri.encodeQueryComponent(message)}');
    } else {
      return Uri.parse(
          'whatsapp://send?phone=$phone&text=${Uri.encodeQueryComponent(message)}');
    }
  }
  // Attempt to launch the WhatsApp URI
  final whatsappUri = getWhatsappUri();
  if (await canLaunchUrl(whatsappUri)) {
    await launchUrl(whatsappUri);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'لا يوجد تطبيق واتساب مثبت أو هناك خطأ.', // Arabic for "WhatsApp is not installed or there's an error."
        ),
      ),
    );
  }
}
