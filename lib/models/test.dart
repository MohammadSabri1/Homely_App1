import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../layout/home_screen.dart';
import '../modules/login_screen/login_screen.dart';
import '../modules/register_screen/cubit_reisster/States_login_screen/registerStates.dart';
import '../modules/register_screen/cubit_reisster/registerCubit.dart';
import '../shared/componentes/componetes.dart';

class register extends StatelessWidget {
  register({super.key});

  var formKey = GlobalKey<FormState>();
  TextEditingController EmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ConfirmpasswordController = TextEditingController();
  TextEditingController FristNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();
  TextEditingController coveController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController DateController = TextEditingController();
  TextEditingController GenderController = TextEditingController();
  bool passShow = true;
  final _val = "-1";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomelyRegisterCubit(),
      child: BlocConsumer<HomelyRegisterCubit, HomelyRegisterStates>(
          listener: (context, state) {
        if (state is HomelyCreateUseSuccessState) {
          pushAndRemoveUntil(context, Homely_Home());
        }
      }, builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'انشاء حساب',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
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
                      SizedBox(
                        height: 20.0,
                      ),
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
                      const SizedBox(
                        height: 20.0,
                      ),
                      defaultTextFormField(
                          controller: DateController,
                          type: TextInputType.datetime,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'برجاء ادخل تاريخ الملاد';
                            }
                            return null;
                          },
                          label: 'تاريخ الملاد',
                          prefixIcon: Icons.calendar_month_outlined,
                          onTab: () {
                            showDatePicker(
                                    //chenage color from theem color
                                    context: context,
                                    firstDate: DateTime.parse('1960-01-01'),
                                    lastDate: DateTime.now(),
                                    initialDate: DateTime.parse('2002-01-01'))
                                .then((value) {
                              //used package intel pub &insert
                              print(DateFormat.yMMMd().format(value!));
                              DateController.text =
                                  DateFormat.yMMMd().format(value);
                            });
                            ;
                          }),
                      //تاريخ الملاد
                      const SizedBox(
                        height: 20.0,
                      ),
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
                          prefixIcon: Icons.transgender_outlined,
                          label: 'النوع',
                          controller: GenderController,
                          type: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'برجاء ادخل رقم التلفون';
                            }
                            return null;
                          }),

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
                      const SizedBox(
                        height: 20.0,
                      ),
                      defaultTextFormField(
                          controller: passwordController,
                          type: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'كلمة المرور غير صحيحه';
                            }
                            return null;
                          },
                          label: 'كلمة المرور',
                          prefixIcon: Icons.lock_outline,
                          suffix: passShow
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          obscureText: passShow,
                          suffixPressed: () {
                            passShow = !passShow;
                          }),
                      // SizedBox(
                      //   height: 20.0,
                      // ),
                      // defaultTextFormField(
                      //     controller: ConfirmpasswordController,
                      //     type: TextInputType.visiblePassword,
                      //     validator: (value){
                      //       if (value!.isEmpty){
                      //         return'تاكيد كلمة المرور غير صحيحه';
                      //      }
                      //      if  (value !=passwordController){
                      //         return'تاكد من كلمه المرور و التاكيد كلمه المرور متطبقطان';
                      //       }
                      //       return null;
                      //     },
                      //     label: 'تاكيد كلمة المرور',
                      //     prefixIcon: Icons.lock_outline,
                      //     suffix:passShow?Icons.visibility_off_outlined:Icons.visibility_outlined,
                      //     obscureText: passShow,
                      //     suffixPressed: () {
                      //       setState(() {
                      //         passShow = !passShow;
                      //       }
                      //       );
                      //     }
                      //     ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      defaultButton(
                          background: Colors.deepOrangeAccent,
                          function: () {
                            if (formKey.currentState!.validate()) {
                              HomelyRegisterCubit.get(context).userRegister(
                                firstName: FristNameController.text,
                                lastName: LastNameController.text,
                                email: EmailController.text,
                                gender: GenderController.text,
                                password: passwordController.text,
                                city: cityController.text,
                                street: streetController.text,
                                date: DateController.text,
                                cover: coveController.text,
                                phone: PhoneController.text,
                              );
                              // pushAndRemoveUntil(context,Homely_Home() );
                            }
                          },
                          text: 'انشاء حساب'),

                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            child: Text(
                              'تسجيل دخول',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
