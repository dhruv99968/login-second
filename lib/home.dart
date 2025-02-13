import 'dart:collection';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:login_second/DataTable/dataTable.dart';
import 'package:login_second/modelClass/demo_model.dart';
import 'package:login_second/pastGame.dart';
import 'package:login_second/upComingGame.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'modelClass/User.dart';
import 'modelClass/interface.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Map<String,dynamic> datas ={};
  List<UpcomingGames> upcomingGames = [];
  List<PastGames> pastGames = [];
  List<dynamic> game =[] ;

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
        game.addAll(upcomingGames);
      });

      //   items = demoModel.upcomingGames ?? [];
    }
    if (demoModel.pastGames != null && demoModel.pastGames!.isNotEmpty) {
      // print('helloo ${demoModel.pastGames}');
      setState(() {

        pastGames.addAll(demoModel.pastGames ?? []);

        game.addAll(pastGames);


        //items.addAll();

         print("items print ${game.length}");
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            leading: null,
            actions: null,
            title: Text("Home"),
            bottom: TabBar(tabs: [
              Tab(icon:Icon( Icons.upcoming_outlined,),text: "UpComingGames",),
              Tab(icon: Icon(Icons.upload_file),text: "PastGames",),
              Tab(icon: Icon(Icons.tag),text: "DataTable",)
            ]),
          ),
          body: TabBarView(children: [ upComingGame(),pastGame(),Datatable()],),
          /*Container(
            height: double.infinity,
            child: Center(
              child: upcomingGames.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("UpComingGames"),
                        Expanded(
                          child: ListView.builder(
                              itemCount: upcomingGames.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
                                  child: Card(
                                    child: ListTile(
                                      leading: Image.network(
                                        game[index].logo.toString() == 'na'
                                            ? 'https://images.pexels.com/photos/826410/pexels-photo-826410.jpeg'
                                            : game[index].logo!,
                                        width: 40,
                                        height: 40,
                                      ),
                                      title: Text(
                                        game[index].gameName!,
                                        style: TextStyle(
                                            color: Colors.blue[500],
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      subtitle: Text(
                                        game[index].id.toString(),
                                        style: TextStyle(
                                            color: Colors.red[500], fontSize: 15),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                        Text("PastGames"),
                        Expanded(
                          child: ListView.builder(
                              itemCount: pastGames.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
                                  child: Card(
                                    child: ListTile(
                                      leading: Image.network(
                                        pastGames[index].logo.toString() == "na"
                                            ? 'https://images.pexels.com/photos/826410/pexels-photo-826410.jpeg'
                                            : pastGames[index].logo!,
                                        width: 40,
                                        height: 40,
                                      ),
                                      title: Text(
                                        pastGames[index].gameName!,
                                        style: TextStyle(
                                            color: Colors.blue[500],
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      subtitle: Text(
                                        pastGames[index].teeTime!,
                                        style: TextStyle(
                                            color: Colors.red[500], fontSize: 15),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
            ),
          )*/

      ),
    );

  }
}
