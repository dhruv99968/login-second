import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


import 'controller/Controller2.dart';
import 'controller/getxStorage.dart';
import 'services.dart';
class Screens extends StatefulWidget {
  const Screens({super.key});

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  final c = Get.find<Controller2>();
  final d = Get.find<Controller2>();
  Services s = Get.find<Services>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   /* WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //  Get.find<Getxstorage>().Getdata();
    ///   getdata();
    });
*/

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screens"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(onPressed: (){
                      Get.back();
                    }, child: Text("Back Screen")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(onPressed: ()async{
                      Fluttertoast.showToast(msg: Get.arguments);
                      print("get data :${Get.arguments}");
                    }, child: Text("Get data")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(onPressed: ()async{
                      Fluttertoast.showToast(msg: Get.parameters['data'].toString());
                      print("get data :${Get.parameters['data']}");
                    }, child: Text("Get data /name")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(onPressed: (){
                      Get.back(result: 'welcome back');
                    }, child: Text("Back with data")),
                  ),

                ],
              ),
            ),

            Text(
              'Getx Services and Binding',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            //Getx Services using Binding
            Text(
              'Getx Services',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Obx(()=> Text('${Get.find<Services>().counter}')),
            ElevatedButton(onPressed: (){
              Get.find<Services>().increment();
            }, child: Text("Servies add value")),
            ElevatedButton(onPressed: (){
              Get.find<Services>().clean();
            }, child: Text("Remove Key from SharedPreferences")),

            //GetX Binding
            Text(
              'GetX Binding',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            //usnig get.create
            Text(
              'Get.create',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            Obx((){

              // final cantrolCreate1 = Get.create<Controller2>(()=>Controller2(),);
              //  final c = Get.find<Controller2>();
              //     final cantrolCreate1 = Get.create<Controller2>(()=>Controller2(),permanent: true);
              return Text(
                'First instance C:${c.counter}',
              );}
            ),

            Obx((){

              // final cantrolCreate1 = Get.create<Controller2>(()=>Controller2(),);

              //     final cantrolCreate1 = Get.create<Controller2>(()=>Controller2(),permanent: true);
              return Text(
                'Second instance d :${d.counter}',
              );}
            ),
            ElevatedButton(onPressed: (){
              c.ink();
            }, child: Text("First instance C")),
            ElevatedButton(onPressed: (){
              d.ink();
            }, child: Text("Second instance d")),


           Obx(()=> Text("name data : ${Get.find<Getxstorage>().nam}")),
            Obx(()=> Text("Integar data : ${Get.find<Getxstorage>().ag}")),
            Obx(()=> Text("Variable data : ${Get.find<Getxstorage>().num}")),
            Obx(()=> Text("Bool data : ${Get.find<Getxstorage>().bool}")),
            Obx(()=> Center(
                  child: Text("map data : ${Get.find<Getxstorage>().mp}")),
            ),
          ],
        )
        ,
      ),
    );
  }
}
