import 'package:get/get.dart';

class CustomButtonController extends GetxController {
  var isLoading = false.obs;
  changeLoading() {
    isLoading.value = !isLoading.value;
    update();
  }
}
