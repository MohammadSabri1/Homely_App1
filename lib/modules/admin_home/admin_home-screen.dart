import 'dart:core';
import 'dart:io';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../shared/componentes/componetes.dart';
import 'cubit/admin_cubit.dart';
import 'cubit/admin_states.dart';

class adminHomeScreen extends StatefulWidget {
   adminHomeScreen({super.key});

  @override
  State<adminHomeScreen> createState() => _adminHomeScreenState();
}

class _adminHomeScreenState extends State<adminHomeScreen> {

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
  TextEditingController DateController =TextEditingController();
  TextEditingController typeController =TextEditingController();
  final pageViewController =ScrollController();
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdmainAddPropertyCubit,admainAddPropertyStates>(
    listener:(context,state){
          if (state is amainAddPropertySuccessState) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('تم نشر العقار بنجاح'),
        duration: Duration(seconds: 3),
      ),
    );
    // pushAndRemoveUntil(context,HomeScreen());
          }
        },
        builder: (context,state){
        var cubit=AdmainAddPropertyCubit.get(context);
        return DefaultTabController(
          length: 3,
          child: Scaffold (
    appBar: AppBar(
      bottom:TabBar(tabs: [
        Tab(child: Text('مهام الموظفين'),),
        Tab(child: Text(' طلبات الايجار'),),
        Tab(child:Text('نشر عقار') ),
      ]
      ),
    ),
    body: Container(
      child: TabBarView(children: [
        Center(child: Text('مهام الموظفين')),
        Center(child: Text(' طلبات الايجار')),
        Center(child:Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Center(
                      child: Text(
                        'اضافه عقار',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    const Text(
                      'العنوان',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey
                      ),
                    ),
                    SizedBox(height: 10.0,),
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
                    Row(
                      children: [
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
                        Spacer(),
                        Container(
                          width:150.0,
                          child: defaultTextFormField(
                            controller:typeController,
                            type:TextInputType.text,
                            validator: (price){
                              if (price!.isEmpty){
                                return'برجاء ادخل نوع العقار';
                              }
                              return null;
                            },
                            label: 'نوع العقار',
                          ),
                        ),
                      ],
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
                    SizedBox(height: 10,),
                    Text(
                      'المرافقين',
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
                            controller:personController,
                            type: TextInputType.number,
                            validator: (value){
                              if (value!.isEmpty){
                                return'برجاء ادخل عدد الافراد';
                              }
                              return null;
                            },
                            label: 'الافراد',
                          ),
                        ),
                        Spacer(),
                        Container(
                          width:150,
                          child: defaultTextFormField(
                              controller: DateController,
                              type: TextInputType.datetime,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'برجاء ادخل تاريخ الاضافه';
                                }
                                return null;
                              },
                              label: 'تاريخ الاضافه',
                              prefixIcon: Icons.calendar_month_outlined,
                              onTab: () {
                                showDatePicker(
                                  //chenage color from theem color
                                    context: context,
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.now(),
                                    initialDate: DateTime.now(),)
                                    .then((value) {
                                  //used package intel pub &insert
                                  print(DateFormat.yMMMd().format(value!));
                                  DateController.text =
                                      DateFormat.yMMMd().format(value);
                                });
                                ;
                              }),
                        ),
                      ],
                    ), //المافظه
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () async {
                             cubit.pickImages();
                          },

                          icon: Icon(Icons.add_photo_alternate_outlined,size: 30,),
                        ),
                        SizedBox(width: 10.0,),
                        Text(
                          'اضافه صور',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: 300,
                      height: 300,
                      child: GridView.builder(
                        controller: pageViewController,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount:cubit.listImagesGallery.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 20.0,
                        ),
                        itemBuilder: (context, index) {
                          if (cubit.listImagesGallery[index].path != null) {
                            return Stack(  // Use another Stack for image and delete button
                              children: [
                                Image.file(File(cubit.listImagesGallery[index].path)),
                                Positioned(  // Position the delete button in bottom right corner
                                  top: 1.0,  // Adjust spacing as needed

                                  child: IconButton(
                                    icon: Icon(Icons.close),
                                    iconSize: 24.0,  // Adjust icon size as needed
                                    color: Colors.orange,  // Customize delete button color
                                    onPressed: () {
                                      setState(() {
                                        cubit.listImagesGallery.removeAt(index);
                                      });
                                      // Remove image from list
                                    },
                                  ),
                                ),
                              ],
                            );
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Text(
                      ' تفصيل اكثر و ملاحظات',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Container(
                      height: 100,
                      width: double.infinity,
                      child: TextFormField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orangeAccent)
                            )
                        ),
                        maxLines: 10,
                        minLines: 2,
                        controller:detailController ,
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    ConditionalBuilder(
                        condition: state is! amainAddPropertyImageLoadingState,
                        builder:(context)=>defaultButton(
                            background: Colors.deepOrangeAccent,
                            function: () async {
                              if (formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('برجاء الانتظار يتم التحميل الان'),
                                    duration: Duration(seconds: 3),
                                  ),
                                );
                                await cubit.uploadImages();
                                cubit.addPropert(
                                  floor: floorController.text,
                                  space: spaceController.text,
                                  view: viewController.text,
                                  pathRom: pathRomController.text,
                                  rom: romController.text,
                                  price: priceController.text,
                                  city: cityController.text,
                                  cover: coverController.text,
                                  street: streetController.text,
                                  detail: detailController.text,
                                  person: personController.text,
                                  images: cubit.urls,
                                  type:typeController.text,
                                  date:DateController.text,
                                  imageFolderName:cubit.imageFolderName,
                                );

                              }
                            },
                            text: 'اضافه'
                        ),
                        fallback: (context)=>Center(child: CircularProgressIndicator(),)
                    ),


                  ],
                ),
              ),
            ],
          ),
        ), ),

      ]
      ),
    ),
          ),
        );

    }
    );
  }
}
