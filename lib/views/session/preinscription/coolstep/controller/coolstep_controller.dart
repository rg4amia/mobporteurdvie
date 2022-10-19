import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../constants/data/churchs/churchs_provider.dart';
import '../../../../../models/drop_list_model.dart';
import '../../../../../models/model_register_student.dart';

class CoolStepController extends GetxController {
  static GetxController get to => Get.find<GetxController>();

  RegisterStudent registerStudent = new RegisterStudent();

  bool? checked = false;
  String valueInput = "";
  void stateCheckbox(bool val) {
    checked = val;
    resp.addAll({'condition_agree': checked.toString()});
    update();
  }

  Map<String, String> resp = {};
  List bapteme = [];
  List engagement = [];
  int? recommandation;

  TextEditingController getdatenaissance = TextEditingController();
  TextEditingController getbaptemeimmersion = TextEditingController();

  DateTime now = new DateTime.now();
  DateTime selectedDate = DateTime.now();

  DateTime dateToday =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  void selectDatedatenaissance(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        locale: const Locale("fr", "FR"),
        context: context,
        firstDate: DateTime(1900),
        lastDate: DateTime(2025),
        initialDate: selectedDate,
        helpText: 'Date de Naissance',
        cancelText: 'Sortie',
        confirmText: 'Ok');

    if (picked != null && picked != selectedDate) {
      DateTime currentTime =
          new DateTime(picked.year, picked.month, picked.day);
      registerStudent.birthday = getdatenaissance.text = currentTime.toString().substring(0, 10);
      resp.addAll({'birthday': getdatenaissance.text});
      update();
    }
    update();
  }

  void selectDatebaptemeimmersion(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        locale: const Locale("fr", "FR"),
        context: context,
        firstDate: DateTime(1900),
        lastDate: DateTime(2025),
        initialDate: selectedDate,
        helpText: 'Date de Naissance',
        cancelText: 'Sortie',
        confirmText: 'Ok');

    if (picked != null && picked != selectedDate) {
      //selectedDate = picked;
      DateTime currentTime =
          new DateTime(picked.year, picked.month, picked.day);
      registerStudent.baptismaldatebyimmersion =
          getbaptemeimmersion.text = currentTime.toString().substring(0, 10);
      resp.addAll({'baptismal_date_by_immersion': registerStudent.baptismaldatebyimmersion!});
      update();
    }
    update();
  }

  void stateValueInput(String selectedvalue) {
    valueInput = selectedvalue;
    update();
  }

  bool enableYearPL = false;
   int? selectedParlerLanguesIndex;

  void changeParlerLanguesIndex(int index) {
    selectedParlerLanguesIndex = index;
    if (index == 0) {
      enableYearPL = true;
      resp.addAll({'in_lang' : '1'});
    } else {
      enableYearPL = false;
      resp.addAll({'in_lang' : '0'});
      registerStudent.inlangdate = "";
    }
    registerStudent.inlang = index;
    update();
  }

  bool enableMActifs = false;
  int? selectedMembreActifsIndex;

  void changeMembreActifsIndex(int index) {
    selectedMembreActifsIndex = index;
    if (index == 0) {
      enableMActifs = true;
      resp.addAll({'actif' : '1'});
    } else {
      enableMActifs = false;
      registerStudent.actifdepartement = "";
      resp.addAll({'actif' : '0'});
    }
    registerStudent.actif = index;
    update();
  }

  bool enablePersChrist = false;
   int? selectedPersonneChristIndex;
  void changePersonneChristIndex(int index) {
    selectedPersonneChristIndex = index;
    if (index == 0) {
      enablePersChrist = true;
      resp.addAll({'convertis' : '1'});
    } else {
      enablePersChrist = false;
      resp.addAll({'convertis' : '0'});
    }
    registerStudent.convertis = index;
    update();
  }

  bool enableDonsTalents = false;
   int? selectedDonsTalentsIndex;
  void changeDonsTalentsIndex(int index) {
    selectedDonsTalentsIndex = index;
    if (index == 0) {
      enableDonsTalents = true;
      resp.addAll({'don':'1'});
      update();
    } else {
      enableDonsTalents = false;
      registerStudent.donv = "";
      resp.addAll({'don':'0'});
      update();
    }
    registerStudent.don = index;
    update();
  }

   File? image = null;
   String? imagePath;
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
      //resp.addAll({'id_photo':image!.path});
      update();
    } else {
      print('No image selected.');
    }
  }

  //List<Church> churchsList = [];
  List<Map<dynamic, dynamic>> churchsList = [];
  DropListModel? ListChurchs;
  bool isLoading = true;
  @override
  void onInit() {
    ChurchsProvider().getPostsList(
      onSuccess: (churchs) {
        Map<String, dynamic> map = {};
        churchs.forEach((element) {
          map = {
            "value": element.value,
            "church_v": element.church_v,
            "church_type": element.church_type,
            "locate": element.locate,
            "state": element.state
          };
          churchsList.add(map);

          ListChurchs = DropListModel([
            OptionItem(id: element.value.toString(), title: element.church_v),
          ]);

        });
        isLoading = false;
        update();
      },
      onError: (error) {
        isLoading = false;
        update();
        print("Error");
      },
    );
    super.onInit();
  }
}
