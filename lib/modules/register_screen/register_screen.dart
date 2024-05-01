import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../layout/homeApp.dart';
import '../../shared/componentes/componetes.dart';
import '../login_screen/login_screen.dart';
import 'addUsers/add_Users.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
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
  List<String> governorates = [
    "القاهرة",
    "الجيزة",
    "الإسكندرية",
    "الشرقية",
    "الدقهلية",
    "القليوبية",
    "المنوفية",
    "الغربية",
    "البحيرة",
    "سوهاج",
    "قنا",
    "الأقصر",
    "أسوان",
    "المنيا",
    "الأسيوط",
    "سويف",
    "البحر الأحمر",
    "الفيوم",
    "الوادي الجديد",
    "شمال سيناء",
    "جنوب سيناء",
    "بورسعيد",
    "الإسماعيلية",
    "السويس",
  ];

  @override
  Widget build(BuildContext context) {
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
                                initialDate: DateTime.now()
                        )
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
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrangeAccent)),
                      labelText: "المحافظة",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'برجاء ادخل الماحفظه';
                      }
                      return null;
                    },
                    icon: Icon(Icons.add_location_alt_outlined),
                    items: governorates
                        .map((governorate) => DropdownMenuItem<String>(
                              value: governorate,
                              child: Text(governorate),
                            ))
                        .toList(),
                    onChanged: (value) {
                      // Handle the selected governorate
                    },
                  ),
                  //المافظه

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
                  DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7.0)),
                        labelText: 'النوع',
                        // suffix:Text('النوع') ,
                        labelStyle:
                            const TextStyle(color: Colors.black, fontSize: 18),
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepOrangeAccent)),
                      ),
                      icon: Icon(Icons.transgender_outlined),
                      value: _val,
                      items: const [
                        DropdownMenuItem(value: "-1", child: Text("ذكر")),
                        DropdownMenuItem(value: "2", child: Text("انثي")),
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'برجاء تحديد النوع';
                        }
                        return null;
                      },
                      onChanged: (v) {}),
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
                        setState(() {
                          passShow = !passShow;
                        });
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
                  SizedBox(
                    height: 30.0,
                  ),
                  defaultButton(
                      background: Colors.deepOrangeAccent,
                      function: () async {
                        if (formKey.currentState!.validate()) {
                        try {
                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: EmailController.text,
                            password: passwordController.text,
                          );

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));

                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('كلمه المرور ضعيفه');
                          } else if (e.code == 'email-already-in-use') {
                            print('الحساب الموجود بفعل لهذ الاميل.');
                          }
                        } catch (e) {
                          print(e);
                        }
                        AddUserinbase addUser = AddUserinbase('John Doe', 'Stokes and Sons', '42');
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
  }
}
