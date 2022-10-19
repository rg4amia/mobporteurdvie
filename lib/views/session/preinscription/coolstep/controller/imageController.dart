import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  static ImageController get to => Get.find<ImageController>();
  late File image;
  late String imagePath;
  var imgPath;
  final _picker = ImagePicker();

  Future<void> getImage(String source) async {
    var imageSource;

    if (source == 'camera') {
      imageSource = ImageSource.camera;
    } else {
      imageSource = ImageSource.gallery;
    }

    final pickedFile = await _picker.getImage(source: imageSource);

    if (pickedFile != null) {
      imgPath = pickedFile.path;
      image = File(pickedFile.path);
      File imagePath = File(pickedFile.path);
      print(imagePath);
      update();
    } else {
      print('No image selected.');
    }
  }
}
