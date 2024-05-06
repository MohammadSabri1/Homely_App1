import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/componentes/componetes.dart';

class editProfileScreen extends StatelessWidget {
   editProfileScreen({super.key});
  var formKey = GlobalKey<FormState>();
  TextEditingController EmailController = TextEditingController();
   TextEditingController FristNameController = TextEditingController();
   TextEditingController LastNameController = TextEditingController();
   TextEditingController PhoneController = TextEditingController();
   TextEditingController coveController = TextEditingController();
   TextEditingController cityController = TextEditingController();
   TextEditingController streetController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         centerTitle: true,
         title: Text('تعديل الحساب',
         style: TextStyle(
           fontWeight: FontWeight.bold,
           fontSize: 18
         ),
         ),
         actions: [IconButton(
             onPressed: (){},
             icon: Icon(Icons.done
             )
         )
         ],

       ),
      body:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Column(
                children: [
                  Center(
                    child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Container(
                          width: 120.0,
                          height: 120.0,
                          child: CircleAvatar(
                            radius: 25.0,
                            backgroundImage: NetworkImage(
                              'https://img.freepik.com/premium-photo/computer-programmer-digital-avatar-generative-ai_934475-9327.jpg?w=740',

                            ),
                          ),
                        ),
                        IconButton(
                            onPressed:
                            (){}, icon: Icon(Icons.camera_alt_outlined))
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  defaultTextFormField(
                    controller: FristNameController,
                    type: TextInputType.text,
                    label: 'الاسم الاول',
                    prefixIcon: Icons.person_2_outlined,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'اسم المستخدم غير صحيح';
                      }
                      return null;
                    },
                  ),
                  //الاسم الاول
                  SizedBox(height: 20.0,),
                  defaultTextFormField(
                    controller: LastNameController,
                    type: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'اسم المستخدم غير صحيح';
                      }
                      return null;
                    },
                    label: 'الاسم الاخير',
                    prefixIcon: Icons.person_2_outlined,
                  ),
                  //الاسم الاخير
                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultTextFormField(
                    controller: EmailController,
                    type: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'برجاء ادخل البريد الاكتروني';
                      }
                      return null;
                    },
                    label: 'البريد الاكتروني',
                    prefixIcon: Icons.email_outlined,
                  ),
                  //البريد الاكتروني
                  SizedBox(height: 20.0,),
                  defaultTextFormField(
                      prefixIcon: Icons.location_on_outlined,
                      label: 'المحافظة',
                      controller: coveController,
                      type: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'برجاء ادخل رقم التلفون';
                        }
                        return null;
                      }),
                  // المافظه

                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultTextFormField(
                    controller: cityController,
                    type: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'برجاء ادخل المدينه';
                      }
                      return null;
                    },
                    label: 'المدينة',
                    prefixIcon: Icons.location_city_outlined,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultTextFormField(
                    controller: streetController,
                    type: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'برجاء ادخل الشارع';
                      }
                      return null;
                    },
                    label: 'الشارع',
                    prefixIcon: Icons.streetview_outlined,
                  ),

                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultTextFormField(
                    controller: PhoneController,
                    type: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'برجاء ادخل رقم التلفون';
                      }
                      return null;
                    },
                    label: 'التلفون',
                    prefixIcon: Icons.phone,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
