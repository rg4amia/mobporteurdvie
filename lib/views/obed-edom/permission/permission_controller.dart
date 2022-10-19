import 'package:get/get.dart';
import '../../../models/permission.dart';
import 'permission_provider.dart';

class PermissionController extends GetxController {
  PermissionProvider _repository = PermissionProvider();

  PermissionController() {
    _repository = Get.find<PermissionProvider>();
  }

  @override
  void onInit() {
    getAllPermission();
    super.onInit();
  }

  RxBool isLoading = false.obs;
  RxBool isLoadingListPermission = false.obs;
  Map<String, dynamic> resp = {};
  PermissionAddResponse? permissionAddResponse;
  List<Permission>? listpermission;

  Future<PermissionAddResponse?> addPermition() async {
    showLoading();
    permissionAddResponse = await _repository.addPermission(resp);
    hideLoading();
    update();
    if (permissionAddResponse != null) {
      return permissionAddResponse;
    } else {
      print("No data recieved");
    }
  }

  Future<List<Permission>?> getAllPermission() async {
    isLoadingListPermission.toggle();
    listpermission = await _repository.getAllPermission();
    isLoadingListPermission.toggle();
    update();
    if(listpermission != null){
      return listpermission;
    } else {
      print("No data recieved getAllPermission");
    }
  }

  showLoading() {
    isLoading.toggle();
  }
  hideLoading() {
    isLoading.toggle();
  }
}