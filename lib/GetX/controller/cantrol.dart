import 'package:get/get.dart';

class Cantrol {

  var data = 0.obs;
  var name = 'dhruv'.obs;
  math(){
    data++;
  }
}
class Can {
  Can({required this.name,required this.num});
  var name =''.obs  ;
  var num ;
  math(){
    num++;
  }
 // Map<String, dynamic> toJson() => {'name': name, 'num': num};

 // factory Can.fromJson(Map<String, dynamic> json) => Can(name: json['name'],num: json['num']);
}