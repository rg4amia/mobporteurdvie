import 'package:get/get.dart';
import 'churchs_provider.dart';

class ChurchsController extends GetxController {
  //List<Church> churchsList = [];
  List<Map<dynamic, dynamic>> churchsList = [];
  bool isLoading = true;
  @override
  void onInit() {
    ChurchsProvider().getPostsList(
      onSuccess: (churchs) {
        //churchsList.add(_convertChurchToMap(churchs));
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
        });
        print(churchsList.length);
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
  /*  Map<String, dynamic> _convertChurchToMap(List<Church> churchs) {
    Map<String, dynamic> map = {};

    churchs.forEach((element) {
      map['church_v'] = element.church_v;
      map['church_type'] = element.church_type;
      map['value'] = element.value;
      map['locate'] = element.locate;
    });
    return map;
  } */
}
//The argument type 'List<Church>' can't be assigned to the parameter type 'Iterable<Map<dynamic, dynamic>>'.
