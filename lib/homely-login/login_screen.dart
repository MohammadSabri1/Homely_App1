import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'dart:io';

class ImageUploader {
  String? url;
  List<XFile> listImagesGallery = [];

  Future<void> pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? pickedFiles = await picker.pickMultiImage();

    // Limit the number of images to select
    if (pickedFiles != null) {
      listImagesGallery.addAll(pickedFiles);
      print('تم اختيار الصور بنجاح');
      // هنا يمكنك استدعاء ميثود لرفع الصور بعد اختيارها
      uploadImages();
    }
  }

  Future<void> uploadImages() async {
    for (XFile image in listImagesGallery) {
      try {
        File file = File(image.path);
        String imageName = basename(image.path);
        var refStorage = FirebaseStorage.instance.ref().child('propertyImagesUser/$imageName');

        await refStorage.putFile(file);
        url = await refStorage.getDownloadURL();
        print('تم رفع الصورة بنجاح. URL: $url');
      } catch (e) {
        print('خطاء في رفع الصورة: $e');
      }
    }
    // يمكنك هنا إصدار حدث بعد رفع جميع الصور
    print('تم رفع جميع الصور بنجاح');
  }
}

// استخدام الكود في واجهة المستخدم
class ImagePickerExample extends StatefulWidget {
  @override
  _ImagePickerExampleState createState() => _ImagePickerExampleState();
}

class _ImagePickerExampleState extends State<ImagePickerExample> {
  final ImageUploader imageUploader = ImageUploader();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('رفع صور متعددة إلى Firebase'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            imageUploader.pickImages();
          },
          child: Text('اختيار ورفع الصور'),
        ),
      ),
    );
  }
}
