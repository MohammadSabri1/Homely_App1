import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import '../../../models/admin/add_property.dart';
import 'admin_states.dart';


class amainAddPropertyCubit extends Cubit<amainAddPropertyStates> {
  amainAddPropertyCubit() :super(amainAddPropertyInitialState());

  static amainAddPropertyCubit get(context) => BlocProvider.of(context);
  List<XFile> listImagesGallery = [];
  List<String> urls = [];
  String? imageFolderName;

  Future<void> pickImages() async {
    final ImagePicker _picker = ImagePicker();
    final List<XFile>? pickedFiles = await _picker.pickMultiImage();

    if (pickedFiles != null) {
      listImagesGallery.addAll(pickedFiles);
      emit(amainSelectPropertyImageSuccessState());
    }
  }

  Future<void> uploadImages() async {
    emit(amainAddPropertyImageLoadingState());
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
    emit(amainAddPropertyImageSuccessState());
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
    required String type,
    required String date,
    required String? imageFolderName,
    required List<String> images,
  }) {

    adminAddPorpertyModle model = adminAddPorpertyModle(
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
      images: images,
      type:type,
      date: date,
      imageFolderName:imageFolderName
    );
    FirebaseFirestore.instance
        .collection('Add Property Admin')
        .doc(city)
        .set(model.toMap())
        .then((value) {
      emit(amainAddPropertySuccessState());
    }).catchError((e) {
      emit(amainAddPropertyErrorState(e.toString()));
    });
  }
}


