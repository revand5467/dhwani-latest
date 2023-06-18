import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Bottom extends GetxController {
  var selectedIndex = 0.obs();
  updateIndex(int index) {
    selectedIndex = index;
  }
}
