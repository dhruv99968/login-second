import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as https;
import 'package:http/http.dart';
import 'package:login_second/modelClass/getxModel.dart';
import 'package:login_second/upComingGame.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modelClass/getxModel.dart';

class Apigetxcontroller extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    listingApis();
    getData();
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  List<UpcomingGames> Upcominggames =<UpcomingGames>[].obs;
  List<PastGames> Pastgames = <PastGames>[].obs;
  late GetxModel getxModel ;
  Future<GetxModel> listingApis() async {
    try {
      String api_url = "https://bga-api.3dlif.com/api";
      String listing_url = "$api_url/games/upcoming";
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      String token = sharedPreferences.getString("Token").toString();
      print("token of shared : $token");
      https.Response response = await https.get( Uri.parse(listing_url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        }, );
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        print("Response of Data model : ${jsonResponse}");
        return GetxModel.fromJson(jsonResponse);
      }
      else {
        print("error");
        return GetxModel();
      }
    } catch (e) {
      print("Error $e");
      return GetxModel();
    }
  }

 Future<void> getData() async{
   getxModel  = await listingApis();
   if(getxModel.upcomingGames!.isNotEmpty ){
     Upcominggames.addAll(getxModel.upcomingGames ??[]);
   }
   else{
     print("error in('upComingGames') getData At getxmodel class");
   }
   if(getxModel.pastGames!.isNotEmpty){
     Pastgames.addAll(getxModel.pastGames ??[]);
   } else{
     print("error in('pastGames') getData At getxmodel class");
   }
  }

}