import 'package:get/get.dart';
import 'package:login_second/GetX/controller/getxStorage.dart';

import 'controller/Controller2.dart';
import 'apiwithGetX.dart';
import 'services.dart';

class GetBinding extends Bindings{
  @override
  void dependencies() async{

      Get.create<Controller2>(()=>Controller2());

    await Get.putAsync<Services>(()async  =>  await Services());
    await Get.putAsync<Apiwithgetx>(()async =>await Apiwithgetx());
    //await Get.putAsync<Getxstorage>(()async =>await Getxstorage());

   // Get.lazyPut<Getxstorage>(()=>Getxstorage());
  }

}
/*
class GetBinding extends Bindings{
  @override
  void dependencies() async{
    // TODO: implement dependencies
    Get.create<Controller2>(()=>Controller2());

    await Get.putAsync<Services>(()async  =>  await Services());
    await Get.putAsync<Apiwithgetx>(()async =>await Apiwithgetx());
  }

}*/
