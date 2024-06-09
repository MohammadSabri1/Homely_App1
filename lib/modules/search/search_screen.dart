import 'package:apphomely/shared/styles/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/componentes/componetes.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key); // تم تعيين الوسيطة key كوسيطة مسماة
  TextEditingController cityController =TextEditingController();
  TextEditingController coverController =TextEditingController();
  TextEditingController streetController =TextEditingController();
  TextEditingController spaceController =TextEditingController();
  TextEditingController priceController =TextEditingController();
  TextEditingController detailController =TextEditingController();
  TextEditingController romController =TextEditingController();
  TextEditingController pathRomController =TextEditingController();
  TextEditingController viewController =TextEditingController();
  TextEditingController floorController =TextEditingController();
  TextEditingController personController =TextEditingController();
  final pageViewController =ScrollController();
  var formKey=GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('البحث',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight:FontWeight.bold
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.2),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  prefixIcon: Icon(IconBroken.Search),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton:
      FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                    height: MediaQuery.of(context).size.height ,
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon:Icon(Icons.done),
                              ),

                              Spacer(),
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon:Icon(Icons.close),
                              ),
                            ],
                          ),
                          Center(
                            child: Text(
                              'المذيد من تفصيل البحث',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          Row(
                            mainAxisAlignment:MainAxisAlignment.start,
                            children: [
                              Container(
                                width:150,
                                child: defaultTextFormField(
                                  controller:cityController,
                                  type: TextInputType.text,
                                  validator: (value){
                                    if (value!.isEmpty){
                                      return'برجاء ادخل المدينه';
                                    }

                                  },
                                  label: 'المدينة',
                                ),
                              ),
                              SizedBox(width: 20,),
                              Container(
                                width:150,
                                child: defaultTextFormField(

                                  controller:coverController,
                                  type: TextInputType.text,
                                  validator: (value){
                                    if (value!.isEmpty){
                                      return'برجاء ادخل المحافظه';
                                    }
                                    return null;
                                  },
                                  label: 'المحافظه',
                                ),
                              ), //المافظه
                            ],
                          ),
                          SizedBox(height: 20,),
                          Container(
                            width:double.infinity,
                            child: defaultTextFormField(
                              controller:streetController,
                              type: TextInputType.text,
                              validator: (value){
                                if (value!.isEmpty){
                                  return'برجاء ادخل الشارع';
                                }
                                return null;
                              },
                              label: 'الشارع',
                            ),
                          ),
                          SizedBox(height: 10,),
                          // Divider(),
                          Text(
                            'السعر',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            width:150.0,
                            child: defaultTextFormField(
                              controller:priceController,
                              type:TextInputType.number,
                              validator: (price){
                                if (price!.isEmpty){
                                  return'برجاء ادخل السعر';
                                }
                                return null;
                              },
                              label: 'السعر',
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            'المرافق',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey
                            ),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Container(
                                width:150,
                                child: defaultTextFormField(
                                  controller:pathRomController,
                                  type: TextInputType.number,
                                  validator: (value){
                                    if (value!.isEmpty){
                                      return'برجاء ادخل عدد الحمامات';
                                    }
                                    return null;
                                  },
                                  label: 'عدد الحمامات',
                                ),
                              ),
                              SizedBox(width: 20.0,),
                              Container(
                                width:150,
                                child: defaultTextFormField(
                                  controller:romController,
                                  type: TextInputType.number,
                                  validator: (value){
                                    if (value!.isEmpty){
                                      return'برجاء ادخل عدد الغرف';
                                    }
                                    return null;
                                  },
                                  label: 'عدد الغرف',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Container(
                            width:double.infinity,
                            child: defaultTextFormField(
                              controller:viewController,
                              type: TextInputType.text,
                              validator: (value){
                                if (value!.isEmpty){
                                  return'برجاء ادخل الاطلاله';
                                }
                              },
                              label: 'الاطلاله',
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            'المساحه',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey
                            ),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment:MainAxisAlignment.start,
                            children: [
                              Container(
                                width:150,
                                child: defaultTextFormField(
                                  controller:floorController,
                                  type: TextInputType.number,
                                  validator: (value){
                                    if (value!.isEmpty){
                                      return'برجاء ادخل الدور';
                                    }
                                    return null;
                                  },
                                  label: 'الدور',
                                ),
                              ),

                              SizedBox(width: 20,),
                              Container(
                                width:150,
                                child: defaultTextFormField(
                                  controller:spaceController,
                                  type: TextInputType.number,
                                  // onChanged: (text){
                                  //   SpaceController.text=SpaceController.text+'م/ع';
                                  // },
                                  validator: (value){
                                    if (value!.isEmpty){
                                      return'برجاء ادخل المساحه';
                                    }
                                    return null;

                                  },
                                  label: 'المساحه',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ),
              );
            },
          );
        },
        child: Icon(IconBroken.Plus,color: Colors.white,),
      ),
    );
  }
}
