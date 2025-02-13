import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:login_second/GetX/controller/Controller2.dart';
import 'package:login_second/GetX/apiwithGetX.dart';
import 'package:login_second/GetX/controller/getxStorage.dart';
import 'package:login_second/GetX/sreen.dart';

import 'controller/cantrol.dart';
import 'controller/getx_cantrol.dart';

class Get_X extends StatefulWidget {
  const Get_X({super.key});

  @override
  State<Get_X> createState() => _Get_XState();
}

class _Get_XState extends State<Get_X> {
  var rxname = "patel".obs;
  var value = 1.obs;
  void m() {
    value++;
    rxname = "dhruv".obs;
  }

  String name = 'dsd';
  Cantrol cantrol = Cantrol();
  var can = Can(name: "DhruvPatel".obs, num: 100.obs);
  GetxCantrol getxCantrol = Get.put(GetxCantrol(), permanent: true);
  GetxCantrol controller = Get.put(GetxCantrol());
  GetxCantrol controller1 = Get.put(GetxCantrol());
  GetxCantrol controller2 = Get.put(GetxCantrol(), tag: 'dhruv');
  //permanent use for alive controller to entire app
  GetxCantrol controller3 = Get.put(GetxCantrol(), permanent: true);
  final controllerLazy1 = Get.lazyPut(() => GetxCantrol());
  final controllerLazy2 = Get.lazyPut(() => GetxCantrol(), tag: 'lazyput1');
  //fenix user for if any time dispos or remove the controller so recreate
  final controllerLazy3 =
      Get.lazyPut(() => GetxCantrol(), tag: 'lazyput2', fenix: true);
  // Get.lazyPut<Controller>(()=>Controller(),tag: "lazy1",fenix: true);

  //Controller2 c = Get.put(Controller2());
  var cantrolCreate1 = Get.create<Controller2>(() => Controller2());
  //Controller2 c = Get.find();
  Controller2 co3 = Get.put(Controller2(), permanent: true);
  final coLazy1 = Get.lazyPut(() => Controller2());
   final coLazy2 = Get.lazyPut(() => Controller2());
  final c = Get.find<Controller2>();
  final d = Get.find<Controller2>();

  final box = GetStorage();
  var names = ''.obs;
  var ages = 0.obs;
  var nums = 0.obs;
  var bools = false.obs;
  // var map = {}.obs ;
  var mps = {}.obs;

  Future<void> Getdata() async{

    setState(() {

    });
    names = box.read("name");
     print( names);
    ages = box.read("age");
     print(ages);
    //  print(box.read('ageo'));
    nums = box.read("number");
    //  print(box.read('number'));
    bools = box.read("bool");
    //  print(box.read('bool'));
    mps = box.read("mapdata");
    //  print("map data :${box.read("mapdata")}");
//    final read = box.read("jsonE");
    //  final name = Can.fromJson(read);
    //  print("json data :${(read)}");
   // update();
  }

//  Future<Controller> asynccontroller = Get.putAsync(()async{return Controller();});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get-X".tr),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Snackbar, Dialog, Bottom sheet".tr,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              Get.snackbar(
                                  "Login Second", //. titleText: Text("Login ..."),
                                  "Hello Good Morning", // messageText: Text("hello good morning"),
                                  snackPosition: SnackPosition.TOP,
                                  icon: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Icon(
                                      Icons.account_circle_outlined,
                                      size: 40,
                                    ),
                                  ),
                                  isDismissible: true,
                                  dismissDirection: DismissDirection.horizontal,
                                  onTap: (value) {
                                    print(value); // value is ---->GetSnackBar
                                  },
                                  //  overlayBlur: 5,
                                  //   overlayColor: Colors.cyan[100],
                                  progressIndicatorBackgroundColor:
                                      Colors.cyan[200],
                                  showProgressIndicator: true,
                                  leftBarIndicatorColor:
                                      Colors.greenAccent[100],
                                  duration: Duration(milliseconds: 3000),
                                  // shouldIconPulse: false,
                                  snackbarStatus: (value) {
                                    print(value); // OPENING and CLOSING
                                  },
                                  snackStyle: SnackStyle.FLOATING,
                                  animationDuration:
                                      Duration(milliseconds: 1000),
                                  colorText: Colors.redAccent[200],
                                  backgroundColor: Colors.grey[100],
                                  barBlur: 1,
                                  borderWidth: 5,
                                  borderRadius: 5,
                                  borderColor: Colors.greenAccent[100],
                                  mainButton: TextButton(
                                      onPressed: () {
                                        Fluttertoast.showToast(msg: "Okay");
                                      },
                                      child: Text("Ok")),
                                  maxWidth: 400,
                                  margin: EdgeInsets.all(10),

                                  // if uncomment than it show only the Textfield
                                  //  userInputForm: Form(child:  TextField()),
                                  forwardAnimationCurve: Curves.bounceIn,
                                  reverseAnimationCurve: Curves.bounceOut,
                                  boxShadows: [
                                    BoxShadow(
                                        color: Colors.red.shade50,
                                        offset: Offset(10, 10),
                                        blurRadius: 10,
                                        blurStyle: BlurStyle.solid,
                                        spreadRadius: 10),
                                  ],
                                  /////nooo
                                  //show snackbar immediately
                                  instantInit: true,
                                  //padding: RenderErrorBox.padding,

                                  //    progressIndicatorController: ,

                                  backgroundGradient: LinearGradient(colors: [
                                    Colors.cyanAccent.shade100,
                                    Colors.greenAccent.shade100
                                  ])
                                  //LinearGradient(colors: [Colors.cyanAccent,Colors.greenAccent,Colors.red,Colors.cyan])
                                  //RadialGradient(colors: [Colors.cyanAccent,Colors.greenAccent,Colors.red,Colors.cyan])
                                  //SweepGradient(colors: [Colors.cyanAccent,Colors.greenAccent,Colors.red,Colors.cyan])

                                  );
                            },
                            child: Text("Snack Bar")),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              //by default dialog
                              // Get.defaultDialog();
                              Get.defaultDialog(
                                  radius: 10,
                                  title: "Alert Dialog",
                                  textCancel: "Cancel",
                                  textConfirm: "Confirm",
                                  //    textCustom: "hello",
                                  titlePadding: EdgeInsets.all(10),
                                  titleStyle:
                                      TextStyle(color: Colors.redAccent[100]),
                                  onCancel: () {
                                    print("Cancel");
                                    Get.back();
                                  },
                                  onConfirm: () {
                                    print("Confirm");
                                    Get.back();
                                    Fluttertoast.showToast(msg: "Okay");
                                  },
                                  // onCustom: (){},
                                  // onWillPop:(){                  },
                                  //    actions: [IconButton(onPressed: (){}, icon: Icon(Icons.clear))],
                                  //override the above buttons cancel and confirm text
                                  //  cancel: Text("C" ),
                                  cancelTextColor: Colors.redAccent[100],
                                  // confirm: Text("c"),
                                  confirmTextColor: Colors.redAccent[100],
                                  content: Container(
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircularProgressIndicator(),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text("Data Loading..."),
                                        )
                                      ],
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.all(10),
                                  backgroundColor: Colors.white,
                                  barrierDismissible: false,
                                  buttonColor: Colors.greenAccent[100],
                                  middleText: "Middle Text",
                                  middleTextStyle:
                                      TextStyle(color: Colors.cyan));
                            },
                            child: Text("Dialog")),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              Get.bottomSheet(
                                Container(
                                  height: 150,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ListTile(
                                        title: Text(
                                          "Light",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        leading:
                                            Icon(Icons.light_mode_outlined),
                                        iconColor: Colors.black,
                                        onTap: () {
                                          Get.changeTheme(ThemeData.light());
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                          "Dark",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        leading:
                                            Icon(Icons.light_mode_outlined),
                                        iconColor: Colors.black,
                                        onTap: () {
                                          Get.changeTheme(ThemeData.dark());
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                //  elevation: 10,
                                //  enableDrag: true,
                                enterBottomSheetDuration:
                                    Duration(milliseconds: 500),
                                //  exitBottomSheetDuration: Duration(milliseconds: 1000),
                                useRootNavigator: true,
                                //  isDismissible: false,
                                ignoreSafeArea: true,
                                isScrollControlled: true,
                                //  persistent: true,
                                settings: RouteSettings(),
                                //  shape:
                                backgroundColor: Colors.cyan[100],
                                //  barrierColor: Colors.redAccent,
                              );
                            },
                            child: Text("Bottom Sheet")),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Route Navigation".tr,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              Get.to(Screens());
                              print("Navigate to next screen");
                            },
                            child: Text("Next Screen")),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              Get.to(Screens(),
                                  arguments: "Get Data from getx page");
                              print(
                                  "Navigate to next screen with data :  Data : 'Get Data from getx page");
                            },
                            child: Text("Next Screen With data")),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              Get.off(Screens());
                            },
                            child: Text("Off Screen")),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              Get.offAll(Screens());
                            },
                            child: Text("OffAll Screen")),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () async {
                              String data = await Get.to(Screens());
                              Fluttertoast.showToast(msg: data);
                            },
                            child: Text("Back Data")),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed('/screen');
                            },
                            child: Text("toNamed")),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              Get.offNamed('/screen');
                            },
                            child: Text("offNamed")),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              Get.offAllNamed('/screen');
                            },
                            child: Text("offAllNamed")),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed('/screen?data=nameDhruv');
                            },
                            child: Text("send data /")),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Reactive state management".tr,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Obx(
                  () => Column(
                    children: [
                      Text(
                          "${"Reactive value is".tr} : $value ${"and Name".tr} :$rxname"),
                      Text(
                          "${"Using Class Reactive value is".tr} : ${cantrol.data.value} ${"and Name".tr} :${cantrol.name.value}"),
                      Text(
                          "${"Using  Required Class RName".tr} :${can.name.value} "),
                      Text("${"and value".tr} ${can.num}"),
                    ],
                  ),
                ),
                OutlinedButton(
                    onPressed: () {
                      m();
                      cantrol.math();
                      can.math();
                    },
                    child: Text("Update with obs".tr)),
                Text(
                  "Separate UI and Business logic".tr,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Obx(() => Text("${"Using GetxController Class value is".tr}: "
                    "${Get.find<GetxCantrol>().cantrol.data}"
                    // getxCantrol.cantrol.data}"
                    )),
                OutlinedButton(
                    onPressed: () {
                      getxCantrol.values();
                      getxCantrol.onInit();
                      // getxCantrol.cantrol.data.value++;
                    },
                    child: Text("GetxController".tr)),
                Text(
                  "Getx Internationalization".tr,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Obx(() => Text(
                    "${"Selected Language is".tr}: ${getxCantrol.selacted}")),
                OutlinedButton(
                    onPressed: () {
                      Get.bottomSheet(
                        Container(
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ListTile(
                                title: Obx(
                                  () => Text(
                                    getxCantrol.selacted == 'hi'
                                        ? "English (Us)"
                                        : "Hindi",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                leading: Icon(Icons.translate),
                                iconColor: Colors.black,
                                onTap: () {
                                  print("lan :::${getxCantrol.selacted}");
                                  if (getxCantrol.selacted == 'hi') {
                                    getxCantrol.Language('en_US');
                                    print(
                                        "change the language is : ${getxCantrol.selacted}");
                                    Get.back();
                                  } else if (getxCantrol.selacted == 'en_US') {
                                    getxCantrol.Language('hi');
                                    print(
                                        "change the language is : ${getxCantrol.selacted}");
                                    Get.back();
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        enterBottomSheetDuration: Duration(milliseconds: 500),
                        exitBottomSheetDuration: Duration(milliseconds: 500),
                        useRootNavigator: true,
                        //  isDismissible: false,
                        ignoreSafeArea: true,
                        isScrollControlled: true,
                        //  persistent: true,
                        settings: RouteSettings(),
                        //  shape:
                        backgroundColor: Colors.yellow[100],
                      );
                    },
                    child: Text("Change Language".tr)),
                Column(
                  children: [
                    Text(
                      'Dependence Injection',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Get.put',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    //use of get.pu
                    Obx(
                      () => Text(
                        'increment done by get.pub : ${controller.counter}',
                      ),
                    ),

                    //if we dont user obx so we have remove the obs from variable
                    // and we have to add getbuilder and give it unique id
                    // in controller we have to update id so we have to reflect the value in ui
                    GetBuilder(
                      id: 'hello',
                      init: GetxCantrol(),
                      builder: (value) {
                        return Text(
                          'increment done by using id :${value.counter1}',
                        );
                      },
                    ),

                    // using tag in get.put with tag and it unique for result
                    Obx(
                      () => Text(
                        'increment done by using Tag : ${Get.find<GetxCantrol>(tag: 'dhruv').counter2}',
                      ),
                    ),

                    //using Permanent in get.put
                    Obx(
                      () => Text(
                        'increment done by using Permanent : ${controller3.counter3}',
                      ),
                    ),

                    //usnig get.lazyput
                    Text(
                      'Get.lazyPut',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Obx(
                      () => Text(
                        'decrement done by Get.lazyPut : ${Get.find<GetxCantrol>().lazy}',
                      ),
                    ),
                    Obx(
                      () => Text(
                        'decrement done by tag : ${Get.find<GetxCantrol>(tag: 'lazyput1').lazy1}',
                      ),
                    ),
                    Obx(
                      () => Text(
                        'decrement done by tag and fenix  : ${Get.find<GetxCantrol>(tag: 'lazyput1').lazy2}',
                      ),
                    ),
                    /*  Obx(()=>
                  Text('',
                    //'${asynccontroller}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
              ),
               Obx(()=>
                Text('',
                  //'${Get.find<Controller>(tag: 'lazy1').counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),*/
                  ],
                ),
                OutlinedButton(
                    onPressed: () {
                      print(
                          "increment done by get.pub : ${controller.counter}");
                      controller.incrementCounter();
                      //using id the counter1 is update in ui part
                      print(
                          "decrement done by get.pub using Id : ${controller1.counter1}");
                      //  controller1.incrementCounter();
                      //
                      //if we are not calling tag variable and method whit tag than it will not update variable
                      //even the method is calling before
                      //where we are using tag
                      print(
                          "decrement done by using Tag : ${Get.find<GetxCantrol>(tag: 'dhruv').counter2}");
                      Get.find<GetxCantrol>(tag: 'dhruv').incrementCounter();
                      print(
                          "increment done by using Permanent : ${controller3.counter3}");
                      //controller3.incrementCounter();
                      print("...................................");
                      print(
                          "decrement done by using lazyput : ${Get.find<GetxCantrol>().lazy}");
                      print(
                          "decrement done by using lazyput and tag : ${Get.find<GetxCantrol>(tag: 'lazyput1').lazy1}");
                      Get.find<GetxCantrol>(tag: 'lazyput1').incrementCounter();
                      print(
                          "decrement done by using lazyput and tag : ${Get.find<GetxCantrol>(tag: 'lazyput2').lazy2}");
                      Get.find<GetxCantrol>(tag: 'lazyput2').incrementCounter();
                      // Get.find<GetxCantrol>().incrementCounter();
                      print("...................................");
                    },
                    child: Text("Dependence Injection")),
                //usnig get.create
                Text(
                  'Get.create',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                Obx(() {
                  // final cantrolCreate1 = Get.create<Controller2>(()=>Controller2(),);
                  //  final c = Get.find<Controller2>();
                  //     final cantrolCreate1 = Get.create<Controller2>(()=>Controller2(),permanent: true);
                  return Text(
                    'First instance C:${c.counter}',
                  );
                }),

                Obx(() {
                  // final cantrolCreate1 = Get.create<Controller2>(()=>Controller2(),);

                  //     final cantrolCreate1 = Get.create<Controller2>(()=>Controller2(),permanent: true);
                  return Text(
                    'Second instance d :${d.counter}',
                  );
                }),
                OutlinedButton(
                    onPressed: () {
                      c.ink();
                    },
                    child: Text("First instance C")),
                OutlinedButton(
                    onPressed: () {
                      d.ink();
                    },
                    child: Text("Second instance d")),

                Text(
                  'API calling using Getx',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                OutlinedButton(
                    onPressed: () {
                      Get.to(Apiwithgetx());
                    },
                    child: Text("API Calling with GetX")),
                Text(
                  'Getx Storage',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Getxstorage',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Obx(()=> Text("name data from Getxstorage: ${Get.find<Getxstorage>().nam}")),
            Obx(()=> Text("Integar data : ${Get.find<Getxstorage>().ag}")),
            Obx(()=> Text("Variable data : ${Get.find<Getxstorage>().num}")),
            Obx(()=> Text("Bool data : ${Get.find<Getxstorage>().bool}")),
           // Center(child: Obx(()=> Text("map data : ${Get.find<Getxstorage>().mp}"))),

                Text(
                  'On screen',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Obx(()=> Text("name data on screen : ${names}")),
                Obx(()=> Text("Integar data : ${ages}")),
                Obx(()=> Text("Variable data : ${nums}")),
                Obx(()=> Text("Bool data : ${bools}")),
               /* Center(
                  child: Obx(()=> Center(
                      child: Text("map data : ${mps}")),
                  ),
                ),*/
                OutlinedButton(
                    onPressed: ()  async{
                   await   Getdata();
                     Get.find<Getxstorage>().Getdata();
                    print('${ Get.find<Getxstorage>().nam}');

                      print('${names}');
                    },
                    child: Text("print data")),

                /* Container(
                  width: 400,
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context,item){
                    return Container(width: 250,height: 50,child: Card(child:
                    Center(child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'incremant done by Get.create${item} : ',
                        ),
                        Obx((){

                  final cantrolCreate1 = Get.create<Controller2>(()=>Controller2(),tag: '$item');

                     //     final cantrolCreate1 = Get.create<Controller2>(()=>Controller2(),permanent: true);
                         return Text(
                            '${Get.find<Controller2>(tag: '$item').list.length}',
                          );}
                            ),
                        IconButton(onPressed: (){
                        //  c2.ink();
                       //   print(Get.find<Controller2>().counter);
                      //    final c2 =  Get.put(Controller2());
                          var v = "valu$item";

                          print(v);
                          final cantrolCreate1 = Get.create<Controller2>(()=>Controller2(),tag: '$item');

                          Get.find<Controller2>(tag: '$item').ink('$item');
                          print(Get.find<Controller2>(tag: '$item').counter);
                          print(Get.find<Controller2>().hashCode);
                          Get.find<Controller2>().ink("$item");
                          print("c valu : ${Get.find<Controller2>().counter}");
                       */
                /*   final cantrolCreate1 = Get.create<Controller2>(()=>Controller2(),permanent: true);

                          Get.find<Controller2>().ink('valu$item');
                          print(Get.find<Controller2>().hashCode);*/
                /*

                       //  c2.list.add(item++);
                        //  c2.list.add(item);
                       //   print("${Get.find<Controller2>().list.length}");

                       //   Get.find<Controller2>().ink();

                        }, icon:Icon( Icons.plus_one)),
                      ],
                    ),
                    ),
                    ));
                  }
                  ,itemCount: 2,
                  ),
                )*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
