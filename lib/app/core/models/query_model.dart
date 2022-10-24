import 'package:get/get.dart';

class QueryController extends GetxController {
  String text = '';

  void updateText(String newText) {
    text = newText;
    update();
  }
}
