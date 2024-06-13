import 'package:apphomely/shared/componentes/componetes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shared/styles/Styles.dart';
import 'detailsporo.dart';

class testHome extends StatelessWidget {
   testHome({super.key});
  List siler = [
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
    return  Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Column(children: [
              GridView.builder(
                itemCount: siler.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, mainAxisExtent: 440.0),
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                    },
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side:
                        BorderSide(color: Colors.grey, width: 2.0),
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
                                siler[i],
                                fit: BoxFit.cover,
                                height: 200,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Text(siler[i]["date"],
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
                            Text(siler[i]["price"],
                                style:
                                TextStyle( fontSize: 16,fontWeight: FontWeight.bold),
                                textAlign: TextAlign.right),
                            SizedBox(height: 12.0,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(siler[i]["titel"],
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
                                        Icons.chat,
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
                                        Icons.call,
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
