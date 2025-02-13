import 'package:flutter/material.dart';
import 'package:login_second/GetX/get_X.dart';
import 'package:login_second/profile.dart';

import 'home.dart';
class firstPage extends StatefulWidget {
  final int index;
  const firstPage({super.key, required this.index});

  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  List<Widget> screen = [HomePage(),Get_X(),Profile()];
  int pageIndex = 0;
 // late int pageIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageIndex = widget.index != null ? widget.index : pageIndex;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[pageIndex],
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.g_mobiledata),label: "GetX"),
        BottomNavigationBarItem(icon: Icon(Icons.manage_accounts_outlined),label: "Profile")
      ],
      currentIndex: pageIndex,
      onTap: (index){
        setState(() {
          pageIndex = index;
        });
    },
      ),
    );
  }
}
