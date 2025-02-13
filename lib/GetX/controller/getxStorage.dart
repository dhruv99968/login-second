import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';



class Getxstorage extends GetxController {


  final box = GetStorage();
  var name = 'dhruv'.obs;
  var age = 15.obs;
  var number = 123456789.obs;
  var bools = true.obs;
 //var map = {}.obs;
  var map = {'value 1':'dhruv',"value 2":"12",'value 3':'123456789','value 4':'true'}.obs;
  Future<void> Storedata()async{

    box.write("name", name);

    box.write("age", age);
    age++;
    box.write("number", number);
    box.write("bool", bools);

    box.write("mapdata", map);
 //   final can = Can(name: 'dhruv'.obs,num: 12.obs);
  //  final tojson = jsonEncode(can.toJson());
  //  box.write("jsonE", tojson.obs);
//    box.writeIfNull('ageo',55.obs);
    update();
  }
  var nam = ''.obs;
  var ag = 0.obs;
  var num = 0.obs;
  var bool = false.obs;
  // var map = {}.obs ;
  var mp = {}.obs;
  Future<void> Getdata()async {
    nam = box.read("name");
    //  print( box.read("name"));
    ag = box.read("age");
    //  print(box.read('age'));
    //  print(box.read('ageo'));
    num = box.read("number");
    //  print(box.read('number'));
    bool = box.read("bool");
    //  print(box.read('bool'));
    mp = box.read("mapdata");
    //  print("map data :${box.read("mapdata")}");
//    final read = box.read("jsonE");
    //  final name = Can.fromJson(read);
    //  print("json data :${(read)}");
    update();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Storedata();
  }
 /* @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
  // await Storedata();
   // Getdata();
  }
  @override
  void onReady() async{
    // TODO: implement onReady
    super.onReady();
   // Storedata();
  //await  Getdata();
  //  Getdata();
    //Storedata();
  }*/
}