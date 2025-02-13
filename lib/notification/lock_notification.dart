import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LockNotification {

  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static final IOSFlutterLocalNotificationsPlugin iosFlutterLocalNotificationsPlugin = IOSFlutterLocalNotificationsPlugin();
  static void initialize() async{
    try{
      // android
      if(Platform.isMacOS){
        print("initialize ");
      }
      if(Platform.isAndroid){
        const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("@mipmap/ic_launcher");
        InitializationSettings initializationSettings = InitializationSettings(
            android: androidInitializationSettings,
           // iOS: darwinInitializationSettings
        );
        flutterLocalNotificationsPlugin.initialize(
          initializationSettings,
          // to handle event when we receive notification
          onDidReceiveNotificationResponse: (details) {
            if (details.input != null) {
              print("$details");
            }
          },
        );
      }
     if(Platform.isIOS){
       final DarwinInitializationSettings darwinInitializationSettings =
       DarwinInitializationSettings(
         requestSoundPermission: true,
         requestBadgePermission: true,
         requestAlertPermission: true,
       );
      /* InitializationSettings initializationSettings = InitializationSettings(
         //android: androidInitializationSettings,
          iOS: darwinInitializationSettings
       );*/
       iosFlutterLocalNotificationsPlugin.initialize(
        // initializationSettings,
           darwinInitializationSettings,
         // to handle event when we receive notification
         onDidReceiveNotificationResponse: (details) {
           if (details.input != null) {
             print("$details");
           }
         },
       );
     }
   //  const InitializationSettings initializationSettingsAndroid = InitializationSettings(android: AndroidInitializationSettings("@mipmap/ic_launcher"));
      // ios




   /*   if(Platform.isAndroid){
        print("<<---Enter in initialize android--->>");
        // Initialization setting for android
     //   const InitializationSettings initializationSettingsAndroid = InitializationSettings(android: AndroidInitializationSettings("@mipmap/ic_launcher"));

        print("<<---end initialize android--->>");
      }
      if(Platform.isIOS){
      print("<<---Enter in initialize ios--->>");

      iosFlutterLocalNotificationsPlugin.initialize(
        darwinInitializationSettings,
        // to handle event when we receive notification
        onDidReceiveNotificationResponse: (details) {
          if (details.input != null) {
            print("$details");
          }
        },
      );
      print("<<---end initialize ios--->>");
    }*/

    }catch(e){
      print("error  ");
    }


  }

  static void display(RemoteMessage message) async {
    // To display the notification in device
    print("message body in display ${message.notification?.body}");
    try {
      if(Platform.isAndroid){
        print("Android title ----->${message.notification?.title}");
        //  final sound = message.notification?.android?.sound;
        final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
        //final cid = message.;
        AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channel_id_5', 'main channel',
            channelDescription: 'your channel description',
            color: Colors.green,
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker'
        );
        NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails,
            //iOS: darwinNotificationDetails
        );
        flutterLocalNotificationsPlugin.show(
            id, message.notification?.title, message.notification?.body, notificationDetails,
            payload: 'item x');
      }
      if(Platform.isIOS){

        print("ios title ----->${message.notification?.title}");
        DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(
          //   presentAlert: true,
          //   presentBadge: true,
          //   presentSound: true,
          // subtitle: "sub title",
        );
        final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
        iosFlutterLocalNotificationsPlugin.show(id, message.notification?.title, message.notification?.body,
        payload: "item x"
        );


      }



        //  final sound = message.notification?.android?.sound;
       // final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
        //final cid = message.;

        /*DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true
        );*/
       // NotificationDetails notificationDetails = NotificationDetails(iOS: darwinNotificationDetails);
        /*flutterLocalNotificationsPlugin.show(
            id, message.notification?.title, message.notification?.body, notificationDetails,
            payload: 'item x');*/



     /*   NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails(
               "channel_id_5",
               "Main Channel",
              groupKey: "gfg",
              color: Colors.green,
              importance: Importance.max,
              sound: RawResourceAndroidNotificationSound("@raw1/Abe.mp3"),
              // different sound for
              // different notification
              playSound: true,
              priority: Priority.high),
        );*/
      /*  await flutterLocalNotificationsPlugin.show(
            id,
            message.notification?.title,
            message.notification?.body,
            notificationDetails,
            payload: message.data['route']
        );*/


    } catch (e) {
      debugPrint("error :"+e.toString());
    }}


  static void initializeMessaging() async {
    FirebaseMessaging firebaseMessage = FirebaseMessaging.instance;

    if (Platform.isIOS) {
      final apnsToken = await firebaseMessage.getAPNSToken();
      final token = await firebaseMessage.getToken();
      print('APNS Token: $apnsToken');
      print("Token: $token");
      Fluttertoast.showToast(msg: apnsToken.toString(),);
      /*SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString("apntoken", apnsToken.toString());
      sharedPreferences.setString("token", token.toString());*/
      // final message = firebaseMessage.getInitialMessage();

      //  print(mess.toString());
      //  await Future.delayed(Duration(seconds: 2));
    }else if(Platform.isAndroid){
      final token = await firebaseMessage.getToken();
      print("Token: $token");
    }
   // final token = await firebaseMessage.getToken();
   // print("Token: $token");
   //final token2 = await firebaseMessage.getAPNSToken();
 //  print("Token: $token2");
  }
}