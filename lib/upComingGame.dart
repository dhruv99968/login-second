import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:login_second/modelClass/demo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
class upComingGame extends StatefulWidget {
  const upComingGame({super.key});

  @override
  State<upComingGame> createState() => _upComingGameState();
}

class _upComingGameState extends State<upComingGame> {
  //Map<String,dynamic> datas ={};
  List<UpcomingGames> upcomingGames = [];
 // List<PastGames> pastGames = [];
 // List<dynamic> game =[] ;

  late DemoModel demoModel;

  // nModel nmode = nModel();
  // Interface interface = Interface();

  //late User
  /*user = User(
  id: datas['upcoming_games']['id'],
  game_name: datas['upcoming_games']['game_name'],
  tee_time: datas['upcoming_games']['tee_time'],
  logo:datas['upcoming_games']['logo'] ,
  logo_grid: datas['upcoming_games']['logo_grid']);*/

  Future<DemoModel> listingApis() async {
    try {
      String api_url = "https://bga-api.3dlif.com/api";
      String listing_url = "$api_url/games/upcoming";
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      String token = sharedPreferences.getString("Token").toString();
      print("token of shared : $token");
      Response response = await get(
        Uri.parse(listing_url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        print("Response of Data model : ${jsonResponse}");

        return DemoModel.fromJson(jsonResponse);

        /* datas = jsonDecode(response.body);

        items = datas['upcoming_games'];
        print('datas ===> $items');
        var data = jsonDecode(response.body.toString());
        // print(data['upcoming_games']);
        print('Error : '+data['error'].toString());
        Fluttertoast.showToast(
            msg: 'Message : '+data['message'].toString(),
            gravity: ToastGravity.BOTTOM,
            toastLength: Toast.LENGTH_LONG);
       // demoModel = DemoModel(message: datas['message'],error: datas['error'],upcomingGames:datas['upcoming_games'] ,pastGames: datas['past_games']);


        upcomingGames.addAll(demoModel.upcomingGames ?? []);
        print("upcoming list => ${upcomingGames.length}");
        print(items);*/
      } /*else if(response.statusCode == 401){
       */ /* var data = jsonDecode(response.body.toString());
        print('Error : '+data['error'].toString());
        Fluttertoast.showToast(
            msg: 'Message : '+data['message'].toString(),
            gravity: ToastGravity.BOTTOM,
            toastLength: Toast.LENGTH_LONG);*/ /*
        return DemoModel();
      }*/
      else {
        return DemoModel();
        print("error");
      }
    } catch (e) {
      print(e);
      return DemoModel();
    }
  }

  Future<void> data() async {
    demoModel = await listingApis();

    if (demoModel.upcomingGames != null &&
        demoModel.upcomingGames!.isNotEmpty) {
      // print('helloo ${demoModel.upcomingGames}');
      setState(() {
        upcomingGames.addAll(demoModel.upcomingGames ?? []);
     //   game.addAll(upcomingGames);
      });

      //   items = demoModel.upcomingGames ?? [];
    }
    if (demoModel.pastGames != null && demoModel.pastGames!.isNotEmpty) {
      // print('helloo ${demoModel.pastGames}');
      setState(() {

      //  pastGames.addAll(demoModel.pastGames ?? []);

       // game.addAll(pastGames);


        //items.addAll();

      //  print("items print ${game.length}");
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listingApis();
    // interface.demomodel();

    // gme.upcomingGames!.length;
    data();
    upcomingGames;
    // demoModel = await listingApis();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: double.infinity,
          child: Center(
            child: upcomingGames.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                      itemCount: upcomingGames.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
                          child: Card(
                            child: ListTile(
                              leading: Image.network(
                                upcomingGames[index].logo.toString() == 'na'
                                    ? 'https://images.pexels.com/photos/826410/pexels-photo-826410.jpeg'
                                    : upcomingGames[index].logo!,
                                width: 40,
                                height: 40,
                              ),
                              title: Text(
                                upcomingGames[index].gameName!,
                                style: TextStyle(
                                    color: Colors.blue[500],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              subtitle: Text(
                                upcomingGames[index].id.toString(),
                                style: TextStyle(
                                    color: Colors.red[500], fontSize: 15),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
        )
    );
  }
}
