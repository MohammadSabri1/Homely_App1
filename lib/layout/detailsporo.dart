import 'package:flutter/material.dart';

class itemsdetals extends StatefulWidget {
  final date;

  itemsdetals({super.key, this.date});

  List detals = [
    {
      "thespce": "190",
      "tyep": "شاليه",
      "rom": "3",
      "floor": "الاول",
      "adress": "الساحل الشمالي اول مراسي بعد البنزينه يمين"
    },
    {
      "thespce": "190",
      "tyep": "شاليه",
      "rom": "3",
      "floor": "الاول",
      "adress": "الساحل الشمالي اول مراسي بعد البنزينه يمين"
    },
    {
      "thespce": "190",
      "tyep": "شاليه",
      "rom": "3",
      "floor": "الاول",
      "adress": "الساحل الشمالي اول مراسي بعد البنزينه يمين"
    },
    {
      "thespce": "190",
      "tyep": "شاليه",
      "rom": "3",
      "floor": "الاول",
      "adress": "الساحل الشمالي اول مراسي بعد البنزينه يمين"
    },
    {
      "thespce": "190",
      "tyep": "شاليه",
      "rom": "3",
      "floor": "الاول",
      "adress": "الساحل الشمالي اول مراسي بعد البنزينه يمين"
    },
  ];

  @override
  State<itemsdetals> createState() => _itemstetestate();
}

class _itemstetestate extends State<itemsdetals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.symmetric(horizontal: 13, vertical: 48),
      children: [
        Image.asset(widget.date['image']),
        Container(
          height: 30,
        ),
        Text(widget.date['price'],
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.orange),
            textAlign: TextAlign.right),
        Text(widget.date['titel'],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            textAlign: TextAlign.right),
        Text(widget.date['subtitel'],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            textAlign: TextAlign.right),
        SizedBox(
          height: 15,
        ),
        Text("_______________________________________________",
            textAlign: TextAlign.center),
        SizedBox(
          height: 15,
        ),
        Text("التفاصيل",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            textAlign: TextAlign.center),
        SizedBox(
          height: 15,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "190 :",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "المساحه: ",
                  style: TextStyle(fontSize: 18),
                ),
                // Text(widget.date['tyep'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.orange ),textAlign: TextAlign.right),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "3 :",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "عد الغرف: ",
                  style: TextStyle(fontSize: 18),
                ),
                // Text(widget.date['tyep'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.orange ),textAlign: TextAlign.right),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "شاليه",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "النوع: ",
                  style: TextStyle(fontSize: 18),
                ),
                // Text(widget.date['tyep'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.orange ),textAlign: TextAlign.right),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "ىنسيكتكمتكمكبمكبمظ :",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "العنوان مفصل: ",
                  style: TextStyle(fontSize: 18),
                ),
                // Text(widget.date['tyep'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.orange ),textAlign: TextAlign.right),
              ],
            ),
          ],
        ),
      ],
    ));
  }
}
