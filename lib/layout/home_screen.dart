import 'dart:async';
import 'package:apphomely/shared/styles/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import '../modules/account_screen/account_screen.dart';
import '../shared/styles/Styles.dart';

class Homely_Home extends StatefulWidget {
  Homely_Home({super.key});

  @override
  State<Homely_Home> createState() => _Homely_HomeState();
}
class _Homely_HomeState extends State<Homely_Home> {
  List property = [
    {
      "image": "images/house1.jpg",
      "price": "8000 ج.م/شهر",
      "titel": "شاليه في الساحل مراسي  الشاحل الشمالي",
      "date":"منذ يومين"
    },
    {
      "image": "images/hose9.jpg",
      "price": "5000 ج.م",
      "titel": "شاليه في الساحل مراسي  الشاحل الشمالي",
      "date":"منذ يومين"
    },
    {
      "image": "images/house3.jpg",
      "price": "5000 ج.م",
      "titel": "شاليه في الساحل مراسي  الشاحل الشمالي",
      "date":"منذ يومين"
    },
    {
      "image": "images/house4.jpg",
      "price": "5000 ج.م",
      "titel": "شاليه في الساحل مراسي  الشاحل الشمالي",
      "date":"منذ يومين"
    },
    {
      "image": "images/house5.jpg",
      "price": "5000 ج.م",
      "titel": "شاليه في الساحل مراسي  الشاحل الشمالي",
      "date":"منذ يومين"
    },
    {
      "image": "images/house6.jpg",
      "price": "5000 ج.م",
      "titel": "شاليه في الساحل مراسي  الشاحل الشمالي",
      "date":"منذ يومين"
    },
    {
      "image": "images/house7.jpg",
      "price": "5000 ج.م",
      "titel": "شاليه في الساحل مراسي  الشاحل الشمالي",
      "date":"منذ يومين"
    },
    {
      "image": "images/house10.jpg",
      "price": "5000 ج.م",
      "titel": "شاليه في الساحل مراسي  الشاحل الشمالي",
      "date":"منذ يومين"
    },

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        // Padding(
        //   padding: const EdgeInsets.all(12.0),
        //   child:ListView(
        //     children: [
        //       Column(
        //         crossAxisAlignment: CrossAxisAlignment.end,
        //         children: [
        //           Container(
        //             width: double.infinity,
        //             child: Image(image: AssetImage('assets/shale2.jpeg')),
        //           ),
        //           SizedBox(
        //             height: 10.0,
        //           ),
        //           Row(
        //             children: [
        //               Text(
        //                 'منذ يومين',
        //                 style: TextStyle(
        //                   fontSize: 12.0,
        //                 ),
        //               ),
        //               Spacer(),
        //               Text(
        //                 'شقه',
        //                 style: TextStyle(
        //                   fontSize: 12.0,
        //                 ),
        //               ),
        //             ],
        //           ),
        //           SizedBox(
        //             height: 10.0,
        //           ),
        //           Text(
        //             '8000 ج.م/شهر',
        //             style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        //           ),
        //           SizedBox(
        //             height: 10.0,
        //           ),
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.end,
        //             children: [
        //               Text(
        //                 ' مدينه واصل كمبوندات الشروق مدينة الشروق القاهرة',
        //                 style: TextStyle(
        //                   fontSize: 10.0,
        //                 ),
        //               ),
        //               Icon(
        //                 Icons.location_on_outlined,
        //                 size: 15,
        //               )
        //             ],
        //           ),
        //           SizedBox(
        //             height: 20,
        //           ),
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //             children: [
        //               Container(
        //                 width: 150.0,
        //                 decoration: const BoxDecoration(
        //                   color: defaultColor,
        //                   borderRadius: BorderRadius.all(Radius.circular(20.0)),
        //                 ),
        //                 child: TextButton(
        //                     onPressed: () {
        //                       WhatsApp(context: context);
        //                       setState(() {});
        //                     },
        //                     child: Icon(
        //                       Icons.chat,
        //                       color: Colors.white,
        //                     )),
        //               ),
        //               Container(
        //                 width: 150.0,
        //                 decoration: const BoxDecoration(
        //                   color: defaultColor,
        //                   borderRadius: BorderRadius.all(Radius.circular(20.0)),
        //                 ),
        //                 child: TextButton(
        //                     onPressed: () {
        //                     //  WhatsAppButton(phoneNumber: '+201014856391', message: 'welcome to homely',);
        //                       WhatsAppButton(
        //                         phoneNumber: "+201223570789",
        //                         message: "مرحبا، كيف يمكنني مساعدتك",
        //                       );
        //
        //                     },
        //                     child: Icon(
        //                       Icons.call,
        //                       color: Colors.white,
        //                     )),
        //               ),
        //             ],
        //           )
        //         ],
        //       ),
        //     ],
        //   ),
        // )
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              Column(children: [
                GridView.builder(
                  itemCount: property.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, mainAxisExtent: 440.0
                  ),
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {

                      },
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side:
                          BorderSide(color: Colors.deepOrange, width: 2.0),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all( 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft:Radius.circular(20.0),
                                        topRight:Radius.circular(20.0))
                                ),
                                width:double.infinity,
                                child: Image.asset(
                                  property[i]["image"],
                                  fit: BoxFit.cover,
                                  height: 200,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Text(property[i]["date"],
                                    textAlign: TextAlign.right,style: TextStyle(fontSize: 11.0),),
                                  Spacer(),
                                  Text(
                                    'شقه',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(property[i]["price"],
                                  style:
                                  TextStyle( fontSize: 16,fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.right),
                              SizedBox(height: 12.0,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(property[i]["titel"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[700]),
                                      textAlign: TextAlign.right),
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: 15,
                                  )
                                ],
                              ),
                              SizedBox(height: 40.0,),
                              Row(
                                children: [
                                  Container(
                                    width: 140.0,
                                    decoration: const BoxDecoration(
                                      color: defaultColor,
                                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                    ),
                                    child: TextButton(
                                        onPressed: () {
                                        },
                                        child: Icon(
                                          IconBroken.Chat,
                                          color: Colors.white,
                                        )),
                                  ),
                                  Spacer(),
                                  Container(
                                    width: 140.0,
                                    decoration: const BoxDecoration(
                                      color: defaultColor,
                                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                    ),
                                    child: TextButton(
                                        onPressed: () {
                                        },
                                        child: Icon(
                                          IconBroken.Call,
                                          color: Colors.white,
                                        )),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
              ),
            ],
          ),
        ),
    );
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
