import 'package:apphomely/shared/componentes/componetes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../models/admin/add_property.dart';
import '../modules/admin_home/cubit/admin_cubit.dart';
import '../modules/admin_home/cubit/admin_states.dart';
import '../shared/styles/Styles.dart';
import '../shared/styles/icons.dart';
import 'detailsporo.dart';

class testHomeAddProperty extends StatefulWidget {
  testHomeAddProperty({super.key});

  @override
  State<testHomeAddProperty> createState() => _testHomeAddPropertyState();
}

class _testHomeAddPropertyState extends State<testHomeAddProperty> {
  PageController boardController = PageController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdmainAddPropertyCubit, admainAddPropertyStates>(
      listener: (context, state) {}, // remove this if not used
      builder: (BuildContext context, state) {
        var cubit = AdmainAddPropertyCubit.get(context);
        List<adminAddPorpertyModle> reversedList = cubit.dataAdminProperty.reversed.toList();
        cubit.getDataProperty();
        return Scaffold(
          body: GridView.builder(
            itemCount: reversedList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, // عدد الأعمدة في الشبكة
              crossAxisSpacing: 8, // مسافة بين الأعمدة
              mainAxisSpacing: 8, // مسافة بين الصفوف
              mainAxisExtent: 440, // ارتفاع كل صف في الشبكة
            ),
            itemBuilder: (context, i) {
              return InkWell(
                onTap: () {

                },
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.deepOrange, width: 2.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            controller: boardController,
                            itemCount: cubit.dataAdminProperty[i].images?.length?? 0,
                            itemBuilder: (context, index) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                height: 200,
                                margin: EdgeInsets.all(8),
                                child: Image.network(
                                  reversedList[i].images?[index]?? '',
                                  fit: BoxFit.cover,
                                  height: 200,
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Text(
                              reversedList[i].date?? '',
                              textAlign: TextAlign.right,
                              style: TextStyle(fontSize: 11.0),
                            ),
                            Spacer(),
                            Text(
                              reversedList[i].type?? '',
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          "  ج.م/شهر${reversedList[i].price?? ''} ",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              reversedList[i].street?? '',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700],
                              ),
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(width: 4.0,),
                            Text(
                              reversedList[i].city?? '',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700],
                              ),
                              textAlign: TextAlign.right,
                            ),
                            Icon(
                              Icons.location_on_outlined,
                              size: 15,
                            ),
                          ],
                        ),
                        SizedBox(height: 40.0),
                        Row(
                          children: [
                            Container(
                              width: 140.0,
                              decoration: const BoxDecoration(
                                color: defaultColor,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(20.0)),
                              ),
                              child: TextButton(
                                onPressed: () {},
                                child: Icon(
                                  Icons.chat,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              width: 140.0,
                              decoration: const BoxDecoration(
                                color: defaultColor,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(20.0)),
                              ),
                              child: TextButton(
                                onPressed: () {},
                                child: Icon(
                                  Icons.call,
                                  color: Colors.white,
                                ),
                              ),
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
        );
      },
    );
  }
}