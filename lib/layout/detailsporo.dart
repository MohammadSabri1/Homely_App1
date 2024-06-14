import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/admin/add_property.dart';
import '../modules/admin_home/cubit/admin_cubit.dart';
import '../modules/admin_home/cubit/admin_states.dart';

class detalsProperty extends StatefulWidget {
  final date;
  final adminAddPorpertyModle property;

  detalsProperty({super.key, this.date, required this.property});

  @override
  State<detalsProperty> createState() => _itemstetestate();
}

class _itemstetestate extends State<detalsProperty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            // عرض الصور
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 200),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.property.images?.length ?? 0,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width, // عرض ثابت
                    height: 200,
                    margin: EdgeInsets.all(8),
                    child: Image.network(
                      widget.property.images?[index] ?? '',
                      fit: BoxFit.cover,
                      height: 200,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10.0,),
            Center(
              child: Text(
                "  ج.م/شهر${widget.property.price?? ''} ",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.property.street?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                  textAlign: TextAlign.right,
                ),
                SizedBox(width: 4.0,),
                Text(
                  widget.property.city?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                  textAlign: TextAlign.right,
                ),
                SizedBox(width: 4.0,),
                Text(
                  widget.property.cover ?? '',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 4.0,),
                Icon(
                  Icons.location_on_outlined,
                  size: 15,
                ),
              ],
            ),
            SizedBox(height: 16.0,),
            Container(
              width: double.infinity,
              height:290 ,
              child: Card(
                   color: Colors.grey[200],
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('الوصف',style: TextStyle(
                          fontSize: 18,fontWeight: FontWeight.bold),),
                      SizedBox(height: 10.0,),
                      Text(
                       '${ widget.property.date ?? ' '}  تاريخ الاضافه ',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '   المساحه   ${widget.property.space ?? ' '}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '  الدور   ${widget.property.floor ?? ' '}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '  الاطلاله   ${widget.property.view ?? ' '}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '  النوع  ${widget.property.type ?? ' '}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '  عدد الغرف  ${widget.property.rom ?? ' '}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '  عدد الحمام  ${widget.property.pathRom ?? ' '}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '   عدد المرافقين  ${widget.property.person ?? ' '}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '   تعليق ${widget.property.detail ?? ' '}',
                        style: TextStyle(fontSize: 16),
                      ),



                    ],
                  ),
                ),

              ),
            ),


          ],
        ),
      ),
    );
  }
}