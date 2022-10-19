import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import '/models/student_data.dart';
import '/views/academie/cours_direct.dart';
import '/views/obed-edom/meditation/meditation.dart';
import '/views/obed-edom/meditation/meditation_binding.dart';
import '/views/obed-edom/vertumetre/vertumetre.dart';
import '/views/obed-edom/vertumetre/vertumetre_binding.dart';
import '/views/login/login.dart';
import '/views/academie/bulletin/detail_bulletin.dart';
import '/views/login/login_binding.dart';
import '../../../constants/Assets.dart';
import '../../../constants/Enums.dart';
import '/constants/color_constants.dart';
import '/widgets/controller/drawer_provider.dart';
import '../controller/drawer_controller.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 5);
  NavigationDrawerWidget(this.selectedIndex, this.setIndex, {Key? key}) : super(key: key);
  int? selectedIndex;
  Function? setIndex;
  final provider = Get.put(DrawerProfileApiClient());
  final controller = Get.put(DrawerProfileController());

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {

    const urlImage = 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';

    return Drawer(
      child: Material(
        color: Colors.white38,
        child: ListView(
          children: <Widget>[
            GetBuilder<DrawerProfileController>(
                init: controller,
                builder: (c) {
                  return c.student != null
                      ? buildHeader(
                          urlImage:
                              c.student == null ? urlImage : c.student!.photo,
                          name: c.student == null
                              ? ""
                              : c.student!.student.fname +
                                  " " +
                                  c.student!.student.lname,
                          numeroetudiant: c.student == null
                              ? ""
                              : c.student!.student.numero,
                          nomSchoolVnomCampV: c.student == null
                              ? ""
                              : c.student!.school.nomSchoolV +
                                  " " +
                                  c.student!.campus.nomCampV,
                          onClicked: () => {
                            //Get.to(LoginPage()),
                            Get.offAll(() => LoginPage(),
                                routeName: '/', binding: LoginBinding())
                          },
                        )
                      : Text("");
                }),
            GetBuilder<DrawerProfileController>(
                init: controller,
                builder: (c) {
                  return c.student != null
                      ? Container(
                          padding: padding,
                          child: Column(
                            children: [
                              buildMenuItem(
                                  text: 'Dashboard',
                                  icon: Icons.dashboard,
                                  onClicked: () => selectedItem(context, 0),
                                  selected: selectedIndex == 0),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('ADMINISTRATEUR',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w100,
                                        color: Colors.grey.shade700,
                                        letterSpacing: 1)),
                              ),
                              buildMenuItem(
                                  text: 'Scolarite & Profil',
                                  icon: FontAwesomeIcons.graduationCap,
                                  onClicked: () => selectedItem(context, 1),
                                  selected: selectedIndex == 1),
                              c.student!.classInfos.paymentStatus > 0
                                  ? Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text('ACADEMIE',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w100,
                                                  color: Colors.grey.shade700,
                                                  letterSpacing: 1)),
                                        ),
                                        buildMenuItem(
                                            text: 'Modules & Cours',
                                            icon: FontAwesomeIcons.university,
                                            onClicked: () =>
                                                selectedItem(context, 3),
                                            selected: selectedIndex == 3),
                                        controller.student!.resultatFinal
                                                    .finalResultat!.id !=
                                                null
                                            ? buildMenuItem(
                                                text: 'Bulletin',
                                                icon: FontAwesomeIcons.fileAlt,
                                                onClicked: () =>
                                                    selectedItem(context, 10),
                                                selected: selectedIndex == 10)
                                            : const SizedBox(),
                                        buildMenuItem(
                                            text: 'Cours en direct',
                                            icon: Icons.account_tree_outlined,
                                            onClicked: () => selectedItem(
                                                context, 4,
                                                studentData: c.student),
                                            selected: selectedIndex == 4),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text('OBED EDOM',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w100,
                                                  color: Colors.grey.shade700,
                                                  letterSpacing: 1)),
                                        ),
                                        buildMenuItem(
                                            text: 'Vertumètre',
                                            icon: FontAwesomeIcons.idBadge,
                                            onClicked: () =>
                                                selectedItem(context, 5),
                                            selected: selectedIndex == 5),
                                        buildMenuItem(
                                            text: 'Meditation',
                                            icon: FontAwesomeIcons.bookOpen,
                                            onClicked: () =>
                                                selectedItem(context, 6),
                                            selected: selectedIndex == 6),
                                        buildMenuItem(
                                            text: 'Permission',
                                            icon: FontAwesomeIcons.edit,
                                            onClicked: () =>
                                                selectedItem(context, 7),
                                            selected: selectedIndex == 7),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text('SUIVI & EVALUATION',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w100,
                                                  color: Colors.grey.shade700,
                                                  letterSpacing: 1)),
                                        ),
                                        /*buildMenuItem(
                              text: 'Assiduite',
                              icon: FontAwesomeIcons.addressBook,
                              onClicked: () => selectedItem(context, 8),
                              selected: selectedIndex == 8),*/
                                        buildMenuItem(
                                            text: 'Réglement interieur',
                                            icon: FontAwesomeIcons.bookmark,
                                            onClicked: () =>
                                                selectedItem(context, 9),
                                            selected: selectedIndex == 9),
                                      ],
                                    )
                                  : const SizedBox(
                                      height: 1,
                                    )
                            ],
                          ),
                        )
                      : Container(
                          padding:const EdgeInsets.only(top: 100, left: 20, right: 20),
                          alignment: Alignment.center,
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Image(
                                image: AssetImage(Assets.no_internet),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Verifier votre connexion internet",
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                })
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String numeroetudiant,
    required String nomSchoolVnomCampV,
    required VoidCallback onClicked,
  }) =>
      Container(
        padding: padding.add(const EdgeInsets.symmetric(vertical: 25)),
        child: Row(
          children: [
            CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
            const SizedBox(width: 10),
            Flexible(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 13,
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    numeroetudiant,
                    style: const TextStyle(fontSize: 12, color: Colors.blueGrey),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    nomSchoolVnomCampV,
                    style: const TextStyle(fontSize: 12, color: Colors.blueGrey),
                  ),
                ],
              ),
            ),
            const Spacer(),
            InkWell(
                onTap: onClicked,
                child: const CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.deepOrangeAccent,
                  child: Icon(Icons.lock_open, color: Colors.white),
                ))
          ],
        ),
      );

  Widget buildSearchField() {
    const color = Colors.white;

    return TextField(
      style: const TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: const TextStyle(color: color),
        prefixIcon: const Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  Widget buildMenuItem(
      {required String text,
      required IconData icon,
      VoidCallback? onClicked,
      bool selected = false}) {
    final color = hexToColor("#008bb2");
    const hoverColor = Colors.white70;

    return Container(
        margin: const EdgeInsets.all(1.5),
        decoration: BoxDecoration(
          border: Border.all(
              color: selected ? Colors.green[300]! : hexToColor("#e0e5e8")),
          borderRadius: BorderRadius.circular(5),
          color: selected ? Colors.green[100] : Colors.transparent,
          // color: selected ? Colors.grey.shade300 : Colors.transparent,
        ),
        child: ListTile(
          leading: Icon(icon, color: color),
          title: Text(text,
              style: TextStyle(
                  color: color,
                  letterSpacing: 0.6,
                  fontWeight: FontWeight.w100)),
          hoverColor: hoverColor,
          onTap: onClicked,
          selected: selected,
        ));
  }

  void selectedItem(BuildContext context, int index,
      {StudentData? studentData}) {
    Navigator.of(context).pop();
    setIndex!(index);
    switch (index) {
      case 0:
        Get.toNamed('/dashboard');
        break;
      case 1:
        Get.toNamed('/administrateur/detail');
        break;
      case 3:
        Get.toNamed('/modules/cours');
        break;
      case 4:
        switch (studentData!.schoolId) {
          case 1:
            Get.to(coursDirect(urlZoom: studentData.schoolLink.ecole1));
            break;
          case 2:
            Get.to(coursDirect(urlZoom: studentData.schoolLink.ecole2));
            break;
          case 3:
            Get.to(coursDirect(urlZoom: studentData.schoolLink.ecole3));
            break;
          case 4:
            Get.to(coursDirect(urlZoom: studentData.schoolLink.ecole4));
            break;
        }
        break;
      case 5:
        Get.to(VertumetrePage(), binding: VertumetreBinding());
        break;
      case 6:
        Get.to(MeditationPage(), binding: MeditationBinding());
        break;
      case 7:
        Get.toNamed('/obed-edom/permission');
        break;
      case 9:
        Get.toNamed('/suivi/reglementinterieur');
        break;
      case 10:
        //Get.toNamed('/bulletin');
        Get.to(detailBulletin(
          resultatFinal:  controller.student!.resultatFinal,
        ));
        break;
    }
  }
}
