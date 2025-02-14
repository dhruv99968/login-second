import 'dart:convert';
import 'dart:io';


import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:login_second/Translate/appTranslate.dart';
import 'package:login_second/create_n_a.dart';
import 'package:login_second/forgot_pass.dart';

import 'package:login_second/notification/lock_notification.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'GetX/controller/apiGetXController.dart';
import 'GetX/binding.dart';
import 'GetX/controller/getxStorage.dart';
import 'GetX/services.dart';
import 'GetX/sreen.dart';
import 'firstpage.dart';

void main() async{
 await WidgetsFlutterBinding.ensureInitialized();
 //await Firebase.initializeApp();
 try {
   if(Platform.isIOS){
     await Firebase.initializeApp(
         options: const FirebaseOptions(
             apiKey: "AIzaSyB_-ZlS6IfHcAgSQkH1q_EQ48d3R0Ofqr4",
             projectId: "login-6947c",
             storageBucket: "login-6947c.firebasestorage.app",
             appId: "1:728779831735:web:4da4da3cd4c4022ff45032",
             messagingSenderId: "728779831735",
             iosBundleId: "com.example.loginSecond",
             authDomain: "login-6947c.firebaseapp.com",
             measurementId: "G-ZPWCZRH829"
         )



     );
   }else{



     await Firebase.initializeApp( name: '[DEFAULT]');

   }
 } catch (e) {
   if (kDebugMode) {
     print(e);
   }
 }
 FirebaseMessaging.onBackgroundMessage(backgroundHandler);
 await GetStorage.init();

 Get.put(Services());
 Get.put(Apigetxcontroller());
 Get.put(Getxstorage());
 runApp(const MyApp());
}
// background handler
Future backgroundHandler(RemoteMessage message) async {
print("new branch");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      initialBinding: GetBinding(),
      getPages: [
        GetPage(name: '/', page: ()=>MyApp()),
        GetPage(name: '/screen', page: ()=> Screens(),binding: GetBinding(),bindings: []),
      ],
   translationsKeys: AppTranslation.translationsKeys,
     locale: Get.deviceLocale,
    //  unknownRoute: GetPage(name: '/notfound', page: ()=>MyApp()),
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

        // colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFFFFFFF)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool pass_hide = true;
  bool emailValid = true;
  bool passValid = true;
  Color emailColor = Color(0xFF1F41BB);
  Color passColor = Color(0xFF1F41BB);
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
Future<void> message ()async{

 /* SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
 String apn = sharedPreferences.getString("apntoken").toString();
  String token = sharedPreferences.getString("token").toString();
*/

  FirebaseMessaging firebaseMessage = FirebaseMessaging.instance;
  NotificationSettings settings =  await firebaseMessage.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print("User granted permission");
    try{

        LockNotification.initializeMessaging();
        LockNotification.initialize();
        //To initialise the sg
        FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message){
          if(message.notification != null){
            print("onMessageOpenedApp message is-->${message.notification?.body}");
          }else{
            print("onMessageOpenedApp message is-->${message.notification?.body}");
          }
        });
        FirebaseMessaging.instance.getInitialMessage().then((message) {
          if(message != null){
            print("instance.getInitialMessage() message is-->${message.notification?.body}");
          }else{
            print("instance.getInitialMessage() message is-->${message?.notification?.body}");
          }

        });

        // To initialise when app is not terminated
        FirebaseMessaging.onMessage.listen((message) {
          if(message.notification != null){
            LockNotification.display(message);
            print("onMessage message is-->${message.notification?.body}");
          }else{
            print("onMessage message is-->${message.notification?.body}");
          }
        });
    }catch(e){
      print("error in token");
    }


  } else {
    print("User denied permission");
  }
  /* RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

   print("initat. ${initialMessage?.notification?.body}");*/
  // if (initialMessage!.notification != null) {
  //   print("initat${initialMessage}");
  //     LockNotification.display(initialMessage);
  // }


}
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    _email.text =  "almasy@yopmail.com";
    _password.text =  "123456";
    message();
    // LockNotification.initialize();
    // To handle when app is open in
// user divide and heshe is using it
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print("on message opened app ${message.toString()}");
//     });
  }

  Future<void> loginUser(String email, String pass) async {
    try {
      String auth_url = "https://bga-auth.3dlif.com";
      String login_url = "$auth_url/realms/users/protocol/openid-connect/token";
      SharedPreferences _sharedPreferences =
          await SharedPreferences.getInstance();
      final response = await http.post(Uri.parse(login_url), body: {
        'username': email,
        'password': pass,
        'client_id': 'android-app',
        'grant_type': 'password'
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        String passError = "Login";
        Fluttertoast.showToast(
            msg: passError,
            gravity: ToastGravity.BOTTOM,
            toastLength: Toast.LENGTH_LONG);
        int i = 0;
       /* Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return firstPage(index:0);
        }));*/
        _sharedPreferences.setString("Token", data['access_token']);
        print( _sharedPreferences.get('Token'));

        // print(data);
        print('.................................');
        print('' + data['access_token']);
        //print('.................................');
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return firstPage(index:0);
        }));
        print('Login successfully');
      } else if (response.statusCode == 401) {
        var passError = jsonDecode(response.body.toString());
        print(passError);
        Fluttertoast.showToast(
            msg: passError['error_description'],
            gravity: ToastGravity.BOTTOM,
            toastLength: Toast.LENGTH_LONG);
        setState(() {

         // emailColor = Colors.red;
         // passColor = Colors.red;
        });
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }
  late final AutovalidateMode autovalidateMode;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      /* appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
     //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,

          backgroundColor: Color(0xFFFFFFFF),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
      //  title: Text(widget.title),
      ),*/
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
              child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Login Here",
                    style: TextStyle(
                        color: Color(0xFF1F41BB),
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Welcome back you’ve been missed!",
                    style: TextStyle(
                      color: Color(
                        0xFF000000,
                      ),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        autocorrect: true,
                      enableSuggestions: true,
                    //  enableIMEPersonalizedLearning: true,
                    //  scribbleEnabled: true,
                    //  showCursor: true,
                      canRequestFocus: true,
                      cursorColor: Colors.greenAccent,
                      cursorOpacityAnimates: true,
                      autofocus: true,
                      decoration: InputDecoration(
                          errorText: emailValid ? null :"Please Email ID",
                          label: Text('Email',style: TextStyle(color: Color(0xFF626262)),),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: emailColor,width: 3),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: emailColor, width: 3),
                          ),
                          /* disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: emailColor,width: 10),
                          ),*/
                        /*  enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: emailColor, width: 3),
                          ),*/
                          /*focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: emailColor, width: 4),
                          ),*/
                         /* errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: emailColor, width: 3),
                          ),*/
                          filled: true,
                          fillColor: Color(0xFFF1F4FF),
                        ),
                      onChanged: (value){
                          setState(() {
                            emailValid = true;
                          });
                      },
                      validator: (value){
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email';
                        } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{3,}$').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                   /* onChanged: (value){
                      final email = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{3,}$');
                      if(email.hasMatch(value) == false){
                        setState(() {
                        //  emailColor = Colors.red;
                          emailValid = false;
                        });
                      }else if(email.hasMatch(value) == true){
                        setState(() {
                         // emailColor = Color(0xFF1F41BB);
                          emailValid = true;
                        });
                      }else{
                        setState(() {
                         // emailColor = Color(0xFF1F41BB);
                          emailValid = true;
                        });
                      }

                    },*/
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                        controller: _password,
                        obscureText: pass_hide,
                        keyboardType: TextInputType.visiblePassword,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      autocorrect: true,
                      enableSuggestions: true,
                      //  enableIMEPersonalizedLearning: true,
                      //  scribbleEnabled: true,
                      //  showCursor: true,
                      canRequestFocus: true,
                      cursorColor: Colors.greenAccent,
                      cursorOpacityAnimates: true,
                      autofocus: true,
                       // maxLength: 12,
                        decoration: InputDecoration(
                          errorText: passValid ? null : "Please Enter Password",
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  pass_hide = !pass_hide;
                                });
                              },
                              icon: pass_hide
                                  ? Icon(Icons.visibility_off_outlined)
                                  : Icon(Icons.visibility_outlined)),
                          label: Text(
                            "Password",
                            style: TextStyle(color: Color(0xFF626262)),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: passColor, width: 3),
                              borderRadius: BorderRadius.circular(10)
                            ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: passColor, width: 3),
                          ),
                         /* enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: passColor, width: 3),
                          ),*/
                          filled: true,
                          fillColor: Color(0xFFF1F4FF),
                        ),
                      onChanged: (value){
                        setState(() {
                          passValid = true;
                        });
                      },
                      validator: (value){
                        if (value == null || value.isEmpty) {
                        //  return 'Please enter an password';
                          return 'Password should be between 8/6 to 12 characters';
                        } else if (value.length < 6) {
                         // return 'Please enter a valid password';
                          return 'Password should be between 8/6 to 12 characters';
                        }else if (value.length == 6) {
                          // return 'Please enter a valid password';
                          return null;
                        }else if (value.length > 12) {
                          // return 'Please enter a valid password';
                          return 'Password should be between 8 to 12 characters';
                        }else if (value.length == 12) {
                          // return 'Please enter a valid password';
                          return null;
                        }
                      //  return null;
                      },
                    /* onChanged: (value){
                       final pass = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]');
                       if(pass.hasMatch(value) == false){
                         setState(() {
                           passValid = false;
                           passColor = Colors.red;
                         });
                       }else if(pass.hasMatch(value) == true){
                         setState(() {
                           passColor = Color(0xFF1F41BB);
                           passValid = true;
                         });
                       }else{
                         setState(() {
                           passColor = Color(0xFF1F41BB);
                           passValid = true;
                         });
                       }
                     },*/
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: InkWell(
                          child: Text(
                            "Forgot your password?",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1F41BB)),
                            textAlign: TextAlign.end,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgotPass()));
                          },
                        ),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: FilledButton(
                          onPressed: () {
                            final email = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                            //final pass = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]');
                            if (_email.text.isEmpty) {
                              setState(() {
                               emailValid = false;
                               // emailColor = Colors.red;
                              });
                              print('Logcat: Please Enter the email');
                              Fluttertoast.showToast(
                                msg: 'Logcat: Please Enter the Email',
                                gravity: ToastGravity.BOTTOM,
                                toastLength: Toast.LENGTH_LONG,
                              );
                            }
                             if (_password.text.isEmpty) {
                              setState(() {
                                passValid = false;
                               // passColor = Colors.red;
                              });
                              print('Logcat: Please Enter the password');
                              Fluttertoast.showToast(
                                msg: 'Please Enter the password',
                                gravity: ToastGravity.BOTTOM,
                                toastLength: Toast.LENGTH_LONG,
                              );
                            }
                             if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
                              setState(() {
                                emailValid = true;
                                passValid =true;
                                // emailColor = Color(0xFF1F41BB);
                                //  passColor = Color(0xFF1F41BB);
                              });
                            //  if (email.hasMatch(_email.text)  && (_password.text.length >=8 && _password.text.length <=12))
                              if (email.hasMatch(_email.text)  && (_password.text.length >=6 && _password.text.length <=12)) {
                                setState(() {
                                  emailValid = true;
                                  passValid =true;
                                 // emailColor = Color(0xFF1F41BB);
                                //  passColor = Color(0xFF1F41BB);
                                });
                                loginUser(_email.text.toLowerCase(), _password.text);
                                print('tap  ->' + _email.text.toLowerCase());
                              }
                              else if (email.hasMatch(_email.text) == false) {
                                setState(() {
                                  emailValid = false;
                                 // emailColor = Colors.red;
                                });
                                print('enter valid email');
                                Fluttertoast.showToast(
                                    msg: 'invalid email formate',
                                    gravity: ToastGravity.BOTTOM,
                                    toastLength: Toast.LENGTH_SHORT);
                              }
                           //   else if (_password.text.length < 8)
                              else if (_password.text.length < 6) {
                                setState(() {
                                  passValid = false;
                                //  passColor = Colors.red;
                                });
                                print('enter valid password');
                                Fluttertoast.showToast(
                                    msg: 'enter valid password',
                                    gravity: ToastGravity.BOTTOM,
                                    toastLength: Toast.LENGTH_SHORT);
                              }
                              else if (_password.text.length > 12) {
                                setState(() {
                                  passValid = false;
                                  //  passColor = Colors.red;
                                });
                                print('enter valid password');
                                Fluttertoast.showToast(
                                    msg: 'enter valid password',
                                    gravity: ToastGravity.BOTTOM,
                                    toastLength: Toast.LENGTH_SHORT);
                              }
                            }
                          },
                          child: Text("Sign in"),
                          style: FilledButton.styleFrom(
                              backgroundColor: Color(0xFF1F41BB),
                              foregroundColor: Color(0xFFFFFFFF),
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                        ),
                      )),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CreateNA()));
                    },
                    child: Text(
                      "Create new account",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(
                            0xFF494949,
                          ),
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  )
                ],
              ),
            ),
          ))),
    );
  }
}
