import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'controller/apiGetXController.dart';
class Pastgamesgetx extends StatefulWidget {
  const Pastgamesgetx({super.key});

  @override
  State<Pastgamesgetx> createState() => _PastgamesgetxState();
}

class _PastgamesgetxState extends State<Pastgamesgetx> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: double.infinity,
          child: Obx(
              ()=> Center(
              child: Get.find<Apigetxcontroller>().Pastgames.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                  itemCount: Get.find<Apigetxcontroller>().Pastgames.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
                      child: Card(
                        color: Colors.deepOrange[100],
                        child: ListTile(
                          leading: Image.network(
                            Get.find<Apigetxcontroller>().Pastgames[index].logo.toString() == "na"
                                ? 'https://images.pexels.com/photos/826410/pexels-photo-826410.jpeg'
                                : Get.find<Apigetxcontroller>().Pastgames[index].logo!,
                            width: 40,
                            height: 40,
                          ),
                          title: Text(
                            Get.find<Apigetxcontroller>().Pastgames[index].gameName!,
                            style: TextStyle(
                                color: Colors.blue[500],
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          subtitle: Text(
                            Get.find<Apigetxcontroller>().Pastgames[index].teeTime!,
                            style: TextStyle(
                                color: Colors.red[500], fontSize: 15),
                          ),
                          onTap: (){
                            Fluttertoast.showToast(msg: "$index",backgroundColor: Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0));
                          },
                        ),
                      ),
                    );
                  }),
            ),
          ),
        )
    );
  }
}
