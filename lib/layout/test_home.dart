import 'package:android_intent_plus/android_intent.dart';
import 'package:apphomely/shared/componentes/componetes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
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
  // PageController _boardController = PageController();
  //
  //
  // @override
  // void initState() {
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   _boardController.dispose(); // Don't forget to dispose it
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdmainAddPropertyCubit, admainAddPropertyStates>(
      listener: (context, state) {}, // remove this if not used
      builder: (BuildContext context, state) {
        if (state is amainAddPropertySuccesspublishState) {
          var cubit = AdmainAddPropertyCubit.get(context);
          List<adminAddPorpertyModle> reversedList = cubit.dataAdminProperty
              .reversed.toList();
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
                final pageController = PageController();
                return InkWell(
                  onTap: () {
                    navigatorTo(
                      context,
                      detalsProperty(
                        date: reversedList[i].date,
                        property: reversedList[i],
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.deepOrange, width: 2.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ClipRect(
                            clipBehavior: Clip.hardEdge,
                            child: Container(
                              padding: const EdgeInsets.only(top:2.0,left: 2),
                              height: 200,
                              child: Stack(
                                  children: [
                                    ListView.builder(
                                      physics: PageScrollPhysics(),
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      scrollDirection: Axis.horizontal,
                                      controller: pageController,
                                      itemCount: cubit.dataAdminProperty[i].images?.length ?? 0,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          width: 350,
                                          height: 200,
                                          child: Image.network(
                                            reversedList[i].images?[index] ?? '',
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      },
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Center(
                                        child: SmoothPageIndicator(
                                          controller: pageController,  // تعيين boardController هنا
                                          count: cubit.dataAdminProperty[i].images?.length?? 0,
                                          effect: ExpandingDotsEffect(
                                              dotColor: Colors.grey,
                                              activeDotColor: defaultColor,
                                              spacing: 5.0,
                                              dotHeight: 10.0,
                                              dotWidth: 10.0,
                                              expansionFactor: 4.0
                                          ),
                                          onDotClicked: (index) {
                                            pageController.jumpToPage(index); // تحديث المتحكم هنا
                                          },
                                        ),
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                          ),
                          SizedBox(height: 6),
                          Container(
                            padding: const EdgeInsets.only(left: 14, right: 14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      reversedList[i].date ?? '',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(fontSize: 11.0),
                                    ),
                                    Spacer(),
                                    Text(
                                      reversedList[i].type ?? '',
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "  ج.م/شهر${reversedList[i].price ?? ''} ",
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
                                      reversedList[i].street ?? '',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[700],
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                    SizedBox(width: 4.0,),
                                    Text(
                                      reversedList[i].city ?? '',
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
                                        onPressed: () async {
                                          const whatsappUrl = 'https://wa.me/+201223570789?text=مرحبا هل مذال متوفر';
                                          await launchUrl(Uri.parse(whatsappUrl), mode: LaunchMode.externalApplication);
                                        },
                                        child: Icon(
                                          Icons.chat,
                                          color: Colors.white,
                                        ),
                                      )
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
                                        onPressed: () async {
                                          final intent = AndroidIntent(
                                            action: 'android.intent.action.DIAL',
                                            data: 'tel:+201223570789',
                                          );
                                          await intent.launch();
                                        },
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

                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }else {
          return Center(child: CircularProgressIndicator());
        }
      }
      );
  }
}