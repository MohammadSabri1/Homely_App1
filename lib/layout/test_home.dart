import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/admin/add_property.dart';
import '../modules/admin_home/cubit/admin_cubit.dart';
import '../modules/admin_home/cubit/admin_states.dart';
import '../shared/styles/Styles.dart';
import '../shared/styles/icons.dart';

class testHomeAddProperty extends StatefulWidget {
   testHomeAddProperty({super.key});

  @override
  State<testHomeAddProperty> createState() => _testHomeAddPropertyState();


}

class _testHomeAddPropertyState extends State<testHomeAddProperty> {

  final pageViewController =ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdmainAddPropertyCubit, admainAddPropertyStates>(
      listener: (context, state) {}, // remove this if not used
      builder: (BuildContext context, state) {
        var cubit = AdmainAddPropertyCubit.get(context);
        return Scaffold(
          body: GridView.builder(
            itemCount: cubit.dataAdminProperty.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,mainAxisSpacing:8,mainAxisExtent: 440),
              itemBuilder: (context,i){

                return InkWell(
                  onTap: () {

                  },
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side:
                      BorderSide(color: Colors.deepOrange, width: 2.0),
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
                            child: Image.network(
                              cubit.dataAdminProperty[i].images?.first?? '',  // افتراض أن الصور هي قائمة من السلاسل
                              fit: BoxFit.cover,
                              height: 440,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Text(cubit.dataAdminProperty[i].date??'',
                                textAlign: TextAlign.right,style: TextStyle(fontSize: 11.0),),
                              Spacer(),
                              Text(
                                cubit.dataAdminProperty[i].type??'',
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(cubit.dataAdminProperty[i].price??'',
                              style:
                              TextStyle( fontSize: 16,fontWeight: FontWeight.bold),
                              textAlign: TextAlign.right),
                          SizedBox(height: 12.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(cubit.dataAdminProperty[i].street??'',
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
                                      IconBroken.Chat,
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
                                      IconBroken.Call,
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
                return null;


              }
          ),
        );
      },
    );
  }
}
