import 'dart:io';
import 'package:apphomely/modules/Add_Property/ccbit/addStates/addPorpertyStates.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../models/add_proprte/add_property_model.dart';
import 'package:path/path.dart';


class HomelyAddPropertyCubit extends Cubit<HomelyAddPropertyStates> {
  HomelyAddPropertyCubit() :super(HomelyAddPropertyInitialState());

  static HomelyAddPropertyCubit get(context) => BlocProvider.of(context);
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
  List<String> RomNum = [
    '1', '2', '3', '4', '5', '6', 'اكثر '
  ];
  List<String> roleProperty = [
    '1', '2', '3', '4', '5', '6', 'اكثر ',
    'شاليه', "منزل", "فيلا"
  ];
  List<String> propertyViews = [
    "إطلالة على البحر مباشرة",
    "صف ثاني على البحر",
    "صف ثالث على البحر",
    "إطلالة جزئية على البحر",
    "إطلالة على مجمع تجاري",
    "إطلالة على شارع مباشر",
    "إطلالة على شارع فرعي",
    "إطلالة على الحديقة",
    "إطلالة على شارع راقي",
    "إطلالة على معلم تاريخي",
    "إطلالة على ساحة عامة",
    "إطلالة على منطقة تجارية",
    "إطلالة على ملعب رياضي",
    "إطلالة على بحيرة",
    "إطلالة على شلال",
  ];

  List<XFile> listImagesGallery = [];
  List<String> urls = [];
  String? imageFolderName;

  Future<void> pickImages() async {
    final ImagePicker _picker = ImagePicker();
    final List<XFile>? pickedFiles = await _picker.pickMultiImage();

    if (pickedFiles!= null) {
      listImagesGallery.addAll(pickedFiles);
      emit(HomelySelectPropertyImageSuccessState());
    }
  }

  Future<void> uploadImages() async {
    emit(HomelyAddPropertyImageLoadingState());
    imageFolderName = DateTime.now().millisecondsSinceEpoch.toString(); // إنشاء اسم مجلد فريد
    final String folderPath = 'property Images User/$imageFolderName'; // إنشاء مسار المجلد

    for (var image in listImagesGallery) {
      File file = File(image.path);
      var imageName = basename(image.path);
      var refStorage = FirebaseStorage.instance.ref().child('$folderPath/$imageName'); // استخدام مسار المجلد الجديد

      try {
        await refStorage.putFile(file);
        String url = await refStorage.getDownloadURL();
        urls.add(url); // <--- تحديث قائمة urls هنا
        print('تم رفع الصور بنجاح. URL: $url');
      } catch (e) {
        print('خطاء في رفع الصور: $e');
      }
    }
    // إذا كنت تريد إرسال حالة نجاح بعد تحميل جميع الصور
    emit(HomelyAddPropertyImageSuccessState());
  }

  void addPropert({
    required String floor,
    required String space,
    required String view,
    required String pathRom,
    required String rom,
    required String price,
    required String city,
    required String cover,
    required String street,
    required String detail,
    required String person,
    required List<String> images, // <--- add this parameter
    required String? imageFolderName, // <--- add this parameter
  }) {
    AddPorpertyModle model = AddPorpertyModle(
      cover: cover,
      city: city,
      street: street,
      price: price,
      rom: rom,
      pathRom: pathRom,
      view: view,
      space: space,
      person: person,
      floor: floor,
      detail: detail,
      images: images, // <--- use the images parameter
      imageFolderName: imageFolderName, // <--- use the folderName parameter
    );
    FirebaseFirestore.instance
        .collection('Add Property User')
        .doc(city)
        .set(model.toMap())
        .then((value) {
      emit(HomelyAddPropertySuccessState());
    }).catchError((e) {
      emit(HomelyAddPropertyErrorState(e.toString()));
    });
  }
}


