import 'dart:convert';

import 'package:http/http.dart';
import 'package:login_second/modelClass/demo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Interface {

  Future<DemoModel> demomodel() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = await sharedPreferences.getString("Token").toString();
    String api_url =  "https://bga-api.3dlif.com/api";
    String listing_url = "$api_url/games/upcoming";
    try{
      Response response = await get(Uri.parse(listing_url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if(response.statusCode == 200)
        {
          var jsonResponse = jsonDecode(response.body);
          print("Response of Data model : ${jsonResponse}");
          return jsonResponse;
        }
      else{
        print("Data Failed");
        return DemoModel();
      }
    }catch(e){
      print("Data Failed : ${e.toString()}");
      return DemoModel();
    }


  }
}