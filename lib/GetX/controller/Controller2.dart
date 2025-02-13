import 'package:get/get.dart';

class Controller2 extends GetxController {

  var counter = 0.obs;

  void ink(){
    counter++;

 //   print(counter);
    update();
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

}