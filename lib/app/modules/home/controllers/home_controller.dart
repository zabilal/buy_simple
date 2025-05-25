import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedOption = ''.obs;
  var isRecording = false.obs;

  void selectOption(String option) {
    selectedOption.value = option;
  }

  void toggleRecording() {
    isRecording.value = !isRecording.value;
  }

  void submitAnswer() {
    if (selectedOption.value.isNotEmpty) {
      // Handle answer submission
      print('Selected: ${selectedOption.value}');
    }
  }
}
