import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'controller/apiGetXController.dart';
class Upcominggamesgetx extends StatefulWidget {
  const Upcominggamesgetx({super.key});

  @override
  State<Upcominggamesgetx> createState() => _UpcominggamesgetxState();
}

class _UpcominggamesgetxState extends State<Upcominggamesgetx> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: double.infinity,
          child: Obx(
            ()=> Center(
              child: Get.find<Apigetxcontroller>().Upcominggames.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                  itemCount: Get.find<Apigetxcontroller>().Upcominggames.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
                      child: Card(
                        color: Colors.lime[100],
                        child: ListTile(
                          leading:
                          Container(
                            decoration: BoxDecoration(
                            //  borderRadius: BorderRadius.circular(0.01),
                              border:  Border(
                                top: BorderSide(color: Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)),
                                left: BorderSide(color: Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)),
                                right: BorderSide(color: Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)),
                                bottom: BorderSide(color: Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)),

                              ),
                                //borderRadius: BorderRadius.circular(100)
                            ),
                            child: Image.network(
                                Get.find<Apigetxcontroller>().Upcominggames[index].logo.toString() == "na"
                                    ? 'https://images.pexels.com/photos/826410/pexels-photo-826410.jpeg'
                                    : Get.find<Apigetxcontroller>().Upcominggames[index].logo!,
                                width: 40,
                                height: 40,
                              ),
                          ),

                          title: Text(
                            Get.find<Apigetxcontroller>().Upcominggames[index].gameName!,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: TextStyle(

                                color: Colors.blue[500],
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          subtitle: Text(
                            Get.find<Apigetxcontroller>().Upcominggames[index].teeTime!,
                            style: TextStyle(

                                color: Colors.red[500], fontSize: 15),
                          )
                          ,trailing: Icon(Icons.insert_emoticon_sharp,color: Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),),
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
