import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sakura/Model/report_001_model.dart';

class Report_001_Screen extends StatefulWidget {
  static const String routeName = "/report_001";

  Report_001_Screen({Key? key}) : super(key: key);

  @override
  State<Report_001_Screen> createState() => _Report_001_ScreenState();
}

class _Report_001_ScreenState extends State<Report_001_Screen> {
  TextEditingController txt_code = TextEditingController();
  TextEditingController txt_description = TextEditingController();
  TextEditingController txt_from_date = TextEditingController();
  TextEditingController txt_to_date = TextEditingController();

  final _list_users_2 = [
    new Report_001("101 (30T)", "NISSEI", "1", "1", "1", "1", "", "", "", "",
        "", "", "", "", ""),
    new Report_001("102 (30T)", "FUNUC", "1", "1", "1", "1", "", "", "", "", "",
        "", "", "", ""),
    new Report_001("103 (30T)", "NISSEI", "1", "1", "1", "1", "", "", "", "",
        "", "", "", "", ""),
    new Report_001("104 (30T)", "FUNUC", "1", "1", "1", "1", "", "", "", "", "",
        "", "", "", ""),
    new Report_001("105 (30T)", "FUNUC", "1", "1", "1", "1", "", "", "", "", "",
        "", "", "", ""),
    new Report_001("106 (30T)", "FUNUC", "1", "1", "1", "1", "", "", "", "", "",
        "", "", "", ""),
    new Report_001("107 (30T)", "FUNUC", "1", "1", "1", "1", "", "", "", "", "",
        "", "", "", ""),
    new Report_001("108 (30T)", "FUNUC", "1", "1", "1", "1", "", "", "", "", "",
        "", "", "", ""),
    new Report_001("101 (60T)", "NISSEI", "1", "1", "1", "1", "", "", "", "",
        "", "", "", "", ""),
    new Report_001("101 (70T)", "FUNUC", "1", "1", "1", "1", "", "", "", "", "",
        "", "", "", ""),
    new Report_001("103 (80T)", "FUNUC", "1", "1", "1", "1", "", "", "", "", "",
        "", "", "", ""),
    new Report_001("104 (30T)", "FUNUC", "1", "1", "1", "1", "", "", "", "", "",
        "", "", "", ""),
    new Report_001("105 (30T)", "FUNUC", "1", "1", "1", "1", "", "", "", "", "",
        "", "", "", ""),
    new Report_001("106 (30T)", "NISSEI", "1", "1", "1", "1", "", "", "", "",
        "", "", "", "", ""),
    new Report_001("107 (30T)", "FUNUC", "1", "1", "1", "1", "", "", "", "", "",
        "", "", "", ""),
    new Report_001("108 (50T)", "FUNUC", "1", "1", "1", "1", "", "", "", "", "",
        "", "", "", ""),
    new Report_001("102 (60T)", "FUNUC", "1", "1", "1", "1", "", "", "", "", "",
        "", "", "", ""),
    new Report_001("103 (70T)", "NISSEI", "1", "1", "1", "1", "", "", "", "",
        "", "", "", "", ""),
    new Report_001("104 (80T)", "FUNUC", "1", "1", "1", "1", "", "", "", "", "",
        "", "", "", ""),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFEFEFEF),
        appBar: AppBar(
          title: Text("Báo cáo"),
        ),
        body: Column(children: [
          Container(
              //padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              color: Colors.white,
              child: Center(
                  child: //Text("Báo cáo tham so"),
                      Column(children: <Widget>[
                Row(children: [
                  Flexible(
                      child: Container(
                          padding: const EdgeInsets.all(5),
                          //height: 50.0,
                          child: const Text(
                            'Ngày báo cáo (*)',
                            style: TextStyle(fontSize: 12),
                          )))
                ]),
                Row(
                  children: [
                    Flexible(
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            height: 50,
                            child: Center(
                                child: TextField(
                              controller: txt_to_date,
                              //editing controller of this TextField
                              decoration: const InputDecoration(
                                  //border: OutlineInputBorder(),
                                  icon: Icon(Icons.calendar_today),
                                  //icon of text field
                                  labelText:
                                      "Ngày báo cáo" //label text of field
                                  ),
                              readOnly: true,
                              //set it true, so that user will not able to edit text
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2101));

                                if (pickedDate != null) {
                                  print(
                                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  print(
                                      formattedDate); //formatted date output using intl package =>  2021-03-16
                                  //you can implement different kind of Date Format here according to your requirement

                                  setState(() {
                                    txt_to_date.text =
                                        formattedDate; //set output date to TextField value.
                                  });
                                } else {
                                  print("Date is not selected");
                                }
                              },
                            ))))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //Center Row contents horizontally,
                    children: [
                      Flexible(
                          child: Container(
                              height: 40,
                              //padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              //padding: const EdgeInsets.all(5),
                              child: RaisedButton(
                                textColor: Colors.white,
                                color: Colors.blue,
                                child: const Text('Xem báo cáo'),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                onPressed: () {
                                  print(txt_code.text);
                                  print(txt_description.text);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text('Chưa được kích hoạt')));
                                },
                              ))),
                      Flexible(
                          child: Container(
                              height: 40,
                              //padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              //padding: const EdgeInsets.all(10),
                              margin: EdgeInsets.fromLTRB(15, 0, 10, 0),
                              child: RaisedButton(
                                textColor: Colors.white,
                                color: Colors.blue,
                                child: const Text('Xuất file Excel'),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                onPressed: () {
                                  print(txt_code.text);
                                  print(txt_description.text);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text('Chưa được kích hoạt')));
                                },
                              )))
                    ],
                  ),
                )
              ]))),
          Expanded(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  color: Colors.white,
                  child: Center(
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: createDataTable())))))
        ]));
  }

  DataTable createDataTable() {
    return DataTable(
        showCheckboxColumn: false,
        sortAscending: true,
        columns: _createColumns(),
        rows: _createRows());
  }

  List<DataColumn> _createColumns() {
    return [
      const DataColumn(
          label: Text('Máy', style: TextStyle(fontWeight: FontWeight.bold))),
      const DataColumn(
          label: Text('Model', style: TextStyle(fontWeight: FontWeight.bold))),
      const DataColumn(
          label: Text('6', style: TextStyle(fontWeight: FontWeight.bold))),
      const DataColumn(
          label: Text('7', style: TextStyle(fontWeight: FontWeight.bold))),
      const DataColumn(
          label: Text('8', style: TextStyle(fontWeight: FontWeight.bold))),
      const DataColumn(
          label: Text('9', style: TextStyle(fontWeight: FontWeight.bold))),
      const DataColumn(
          label: Text('10', style: TextStyle(fontWeight: FontWeight.bold))),
      const DataColumn(
          label: Text('11', style: TextStyle(fontWeight: FontWeight.bold))),
      const DataColumn(
          label: Text('12', style: TextStyle(fontWeight: FontWeight.bold))),
      const DataColumn(
          label: Text('1', style: TextStyle(fontWeight: FontWeight.bold))),
      const DataColumn(
          label: Text('2', style: TextStyle(fontWeight: FontWeight.bold))),
      const DataColumn(
          label: Text('3', style: TextStyle(fontWeight: FontWeight.bold))),
      const DataColumn(
          label: Text('4', style: TextStyle(fontWeight: FontWeight.bold))),
      const DataColumn(
          label: Text('5', style: TextStyle(fontWeight: FontWeight.bold))),
      const DataColumn(
          label: Text('6', style: TextStyle(fontWeight: FontWeight.bold))),
    ];
  }

  List<DataRow> _createRows() {
    return _list_users_2
        .map((e) => DataRow(cells: [
              DataCell(Text(e.may.toString())),
              DataCell(Text(e.model.toString())),
              DataCell(Text(e.c6.toString())),
              DataCell(Text(e.c7.toString())),
              DataCell(Text(e.c8.toString())),
              DataCell(Text(e.c9.toString())),
              DataCell(Text(e.c10.toString())),
              DataCell(Text(e.c11.toString())),
              DataCell(Text(e.c12.toString())),
              DataCell(Text(e.c1.toString())),
              DataCell(Text(e.c2.toString())),
              DataCell(Text(e.c3.toString())),
              DataCell(Text(e.c4.toString())),
              DataCell(Text(e.c5.toString())),
              DataCell(Text(e.c6_x.toString())),
            ]))
        .toList();
  }
}
