import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../layout/homeApp.dart';
import '../../layout/home_screen.dart';
import '../../shared/componentes/componetes.dart';
import 'ccbit/addStates/addPorpertyStates.dart';
import 'ccbit/addporpertyCubit.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {

  List<XFile> _images = [];
  Future<void> _pickImages() async {
    final _picker = ImagePicker();
    final _pickedFiles = await _picker.pickMultiImage();
    // Limit the number of images to select
    if (_pickedFiles != null) {
      setState(() {
        _images.addAll(_pickedFiles.map((file) => file));
      });
    }
  }
  void imagePicker()async{
    var image=await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _images=image as List<XFile>;
    });
  }
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>HomelyAddPropertyCubit(),
      child:BlocConsumer<HomelyAddPropertyCubit,HomelyAddPropertyStates>(
        listener:(context,state){
          if (state is HomelyAddPropertySuccessState) {
            pushAndRemoveUntil(context,HomeScreen());
          }
        },
          builder: (context,state){
          return Scaffold(
          // appBar: AppBar(
          //   title: Text(
          //     'اضافه عقار',
          //     style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       fontSize: 20.0
          //     ),
          //   ),
          //   centerTitle: true,
          //   leading:(
          //       IconButton(
          //         onPressed: () {
          //           Navigator.pushReplacement(context,
          //               MaterialPageRoute(builder: (context) =>HomeScreen()));
          //         }, icon: Icon(
          //           Icons.arrow_back),
          //       )
          //   ),
          // ),
          body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
          children: [
          Form(
          key: formKey,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment:MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: (){
                      navigatorTo(context, HomeScreen());
                    }, icon: Icon(Icons.arrow_back))
              ],
            ),
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
          SizedBox(height: 10,),
          Text(
          'المرافقين',
          style: TextStyle(
          fontSize: 18,
          color: Colors.grey
          ),
          ),
          SizedBox(height: 10,),
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
          ), //المافظه
          SizedBox(height: 10,),
          Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          IconButton(
          onPressed: () async {
          _pickImages();
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
          itemCount: _images.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 20.0,
    ),
    itemBuilder: (context, index) {
    if (_images[index].path != null) {
    return Stack(  // Use another Stack for image and delete button
    children: [
    Image.file(File(_images[index].path)),
    Positioned(  // Position the delete button in bottom right corner
    top: 1.0,  // Adjust spacing as needed

    child: IconButton(
    icon: Icon(Icons.close),
    iconSize: 24.0,  // Adjust icon size as needed
    color: Colors.orange,  // Customize delete button color
    onPressed: () {
    setState(() {
    _images.removeAt(index);  // Remove image from list
    });
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
    defaultButton(
    background: Colors.deepOrangeAccent,
    function: (){
    if(formKey.currentState!.validate()){
      HomelyAddPropertyCubit.get(context).addPropert(
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
          person: personController.text
      );
    }

    },
    text: 'اضافه'
    ),


    ],
    ),
    ),
    ],
    ),
    ),
    );
    },

      ),
    );
  }
}