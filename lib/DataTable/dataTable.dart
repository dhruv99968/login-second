import 'package:flutter/material.dart';
class Datatable extends StatefulWidget {
  const Datatable({super.key});

  @override
  State<Datatable> createState() => _DatatableState();
}

class _DatatableState extends State<Datatable> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child:SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DataTable(
                  columns: const [
                    DataColumn(label: Text("Id")),
                    DataColumn(label: Text("Name")),
                    DataColumn(label: Text("Phone Number"))
                  ],
                  rows: const [

                    DataRow(cells: [DataCell(Text("1")),DataCell(Text("user name")),DataCell(Text("987654321"))]),
                    DataRow(cells: [DataCell(Text("2")),DataCell(Text("Dhruv")),DataCell(Text("987654321"))]),
                    DataRow(cells: [DataCell(Text("3")),DataCell(Text("Dhruv")),DataCell(Text("987654321"))]),
                    DataRow(cells: [DataCell(Text("4")),DataCell(Text("Dhruv")),DataCell(Text("987654321"))]),
                    DataRow(cells: [DataCell(Text("5")),DataCell(Text("Dhruv")),DataCell(Text("987654321"))]),
                    DataRow(cells: [DataCell(Text("6")),DataCell(Text("Dhruv")),DataCell(Text("987654321"))]),
                    DataRow(cells: [DataCell(Text("7")),DataCell(Text("user name")),DataCell(Text("987654321"))]),
                    DataRow(cells: [DataCell(Text("8")),DataCell(Text("Dhruv")),DataCell(Text("987654321"))]),
                    DataRow(cells: [DataCell(Text("9")),DataCell(Text("Dhruv")),DataCell(Text("987654321"))]),
                    DataRow(cells: [DataCell(Text("10")),DataCell(Text("Dhruv")),DataCell(Text("987654321"))]),
                    DataRow(cells: [DataCell(Text("11")),DataCell(Text("Dhruv")),DataCell(Text("987654321"))]),
                    DataRow(cells: [DataCell(Text("12")),DataCell(Text("Dhruv")),DataCell(Text("987654321"))]),

                  ],
              headingRowHeight: 70,
             // columnSpacing: 30,
               // dividerThickness: 1,
                // showBottomBorder:true,
                headingTextStyle: TextStyle(color: Colors.green ,fontSize: 17),
                border: TableBorder(borderRadius: BorderRadius.all(Radius.circular(10),),),
                dataTextStyle: TextStyle(color: Colors.redAccent,fontSize: 17),
          //sortAscending: false,
              // sortAscending: false,
                //showCheckboxColumn: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

