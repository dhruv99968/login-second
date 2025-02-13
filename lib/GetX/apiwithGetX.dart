import 'package:flutter/material.dart';

import 'PastGamesGetX.dart';
import 'upComingGamesGetX.dart';
class Apiwithgetx extends StatefulWidget {
  const Apiwithgetx({super.key});

  @override
  State<Apiwithgetx> createState() => _ApiwithgetxState();
}

class _ApiwithgetxState extends State<Apiwithgetx> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child:Scaffold(
      appBar: AppBar(
        title: Text('Api Calling with GetX'),
        bottom:  TabBar(tabs: [
          Tab(icon: Icon(Icons.upcoming),text: "UpComingGames",),
          Tab(icon: Icon(Icons.upload),text: "PastGames",)
        ]),
      ),
      body: TabBarView(children: [Upcominggamesgetx(),Pastgamesgetx()]),
    ));
  }
}
