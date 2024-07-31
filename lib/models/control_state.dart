import 'package:get/get_state_manager/get_state_manager.dart';

class ControlState extends GetxController {
  bool darkMode = true;
  void changeDarkMode(value) {
    darkMode = value;
    update();
  }

  int index = 2;
  void changeIndex(value) {
    index = value;
    update();
  }
}
