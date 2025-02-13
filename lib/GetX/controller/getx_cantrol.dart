import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'cantrol.dart';
import '../sreen.dart';
class GetxCantrol extends GetxController {

  Cantrol cantrol = Cantrol();
  void values(){

    if(cantrol.data.value == 5){
      Fluttertoast.showToast(msg: "Its 5th index");
      cantrol.data.value = 50;

    }else if(cantrol.data >=55){
     //  cantrol.data = 0.obs;
       cantrol.data.value = 0;
     // dispose();
    }else{
      cantrol.data.value++;
    }
    print("texts : ${ cantrol.name.value} "+"value : ${cantrol.data.value}");
    update();
  }
  currentValue(data){
    print("using ''ever'' method in worker via method :${cantrol.data.value} and data $data");
   // update();
  }

  final selacted = Get.locale!.languageCode.obs;
  void Language(lan){
    print(selacted);
    selacted.value = lan;
    Locale locale = Locale(lan);
    Get.updateLocale(locale);
    print(selacted);
  }

//for Dependence Injection
var counter = 0.obs;

  var counter1 = 5;
  var counter2 = 10.obs;
  var counter3 = 15.obs;
  var lazy = 1000.obs;
  var lazy1 = 2000.obs;
  var lazy2 = 3000.obs;
  void incrementCounter() {
    // This call to setState tells the Flutter framework that something has
    // changed in this State, which causes it to rerun the build method below
    // so that the display can reflect the updated values. If we changed
    // _counter without calling setState(), then the build method would not be
    // called again, and so nothing would appear to happen.
    counter++;
    counter1++;

    counter2++;
    counter3++;
    lazy--;
    lazy1--;
    lazy2--;

    update(['lazyput1']);
    update(['lazyput2']);
     update(['hello']);
     update(['dhruv']);
   // update();
  }

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose");
    print("dispose from controller class...");
    cantrol.data.value = 0;
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    selacted;
   // Language('en_US');
    print("onInit method ");
    // ever both initializeation give us same result
      ever(cantrol.data,currentValue);
     ever(cantrol.data, (_)=>print("using ''ever'' method in workers the value is :${cantrol.data.value}"));

    // everAll give us same result
    everAll([cantrol.data], (_)=>print('using "everAll" method in workers the value is : ${cantrol.data.value}'));

    // using once give result only one time where above method give result many time via indexs
    // if index is incress than the add one more result in previews result
    once(cantrol.data, (_)=>print("using ''once'' method in workers the value is : ${cantrol.data}"));

    // debounce give us results delay for given time
    debounce(cantrol.data,(value)=> print("using ''debounce'' method in workers after 3 second the value is :${cantrol.data.value}"),time: Duration(seconds: 3));

    interval(cantrol.data, (value)=>print("using ''interval'' method in workers after 1 second the value is :${cantrol.data.value}"),time: Duration(seconds: 1));

  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    print("onReady method");

  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print("onClose method");
    print("OnClose from controller class...");

  }
}
