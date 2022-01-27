import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  static const String routeName = "/report";

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
              child: const Center(
                child: Text("Báo cáo tham so"),
              )),
          Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              color: Colors.white,
              child: const Center(child: Text("Báo cáo PDF")))
        ]));
  }
}
