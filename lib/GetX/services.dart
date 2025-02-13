import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Services extends  GetxService{
  RxInt counter = 0.obs ;
  void increment()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    counter++;
    sharedPreferences.setInt("counterValue",counter.value);
  }
  void value()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    counter.value = sharedPreferences.getInt("counterValue") ?? 0  ;
  }
  void clean()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("counterValue");
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
   // increment();
    value();
  }

@override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    clean();
  }
}
