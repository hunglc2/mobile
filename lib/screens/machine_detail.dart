import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sakura/screens/home.dart';
import 'package:intl/intl.dart';
import 'package:sakura/Model/machine_model.dart';

class MachineDetailScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MachineDetailScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  List<bool> isSelected = List.generate(3, (_) => false);

  TextEditingController txt_code = TextEditingController();
  TextEditingController txt_description = TextEditingController();
  TextEditingController txt_notification = TextEditingController();
  String dd_location = 'AMATA';
  String dd_model = 'FANUC';

  String result = "Hello World...!";

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final machine = ModalRoute
        .of(context)!
        .settings
        .arguments as String;

    txt_code.text = machine; //machine.code.toString();

    return Scaffold(
        resizeToAvoidBottomInset: false, // set it to false
        appBar: AppBar(
          title: const Text("Thông tin máy chi tiết"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    // Code +++++++++++++++++++++
                    Row(
                      children: [
                        Flexible(
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                child: const Text(
                                  'Mã máy (*)',
                                  style: TextStyle(fontSize: 12),
                                )))
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              height: 50.0,
                              child: TextField(
                                readOnly: true,
                                controller: txt_code,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Code (*)',
                                ),
                              ),
                            ))
                      ],
                    ),

                    // Description +++++++++++++++++++++
                    Row(
                      children: [
                        Flexible(
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                child: const Text(
                                  'Diễn giải',
                                  style: TextStyle(fontSize: 12),
                                )))
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              height: 50.0,
                              child: TextField(
                                controller: txt_description,
                                decoration: const InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: 'Description',
                                ),
                              ),
                            ))
                      ],
                    ),

                    // Model +++++++++++++++++++++
                    Row(
                      children: [
                        Flexible(
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                child: const Text(
                                  'Model',
                                  style: TextStyle(fontSize: 12),
                                )))
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              height: 50.0,
                              child: DropdownButtonFormField<String>(
                                  isDense: false,
                                  itemHeight: 50,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.all(10)),
                                  isExpanded: true,
                                  value: dd_model,
                                  //icon: const Icon(Icons.arrow_downward),
                                  //elevation: 10,
                                  //style: const TextStyle(color: Colors.deepPurple),
                                  //underline: Container(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dd_model = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    'FANUC',
                                    'NISSEI',
                                    'SUMITOMO',
                                    'SODISK'
                                  ].map<DropdownMenuItem<String>>((
                                      String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList()),
                            ))
                      ],
                    ),

                    // Location +++++++++++++++++++++
                    Row(
                      children: [
                        Flexible(
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                child: const Text(
                                  'Thuộc xưởng/ nhà máy',
                                  style: TextStyle(fontSize: 12),
                                )))
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              height: 50.0,
                              child: DropdownButtonFormField<String>(
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.all(10)),
                                  isExpanded: true,
                                  value: dd_location,
                                  //icon: const Icon(Icons.arrow_downward),
                                  //elevation: 10,
                                  //style: const TextStyle(color: Colors.deepPurple),
                                  //underline: Container(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dd_location = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    'AMATA',
                                    'Bình Dương',
                                    'Thủ Đức'
                                  ].map<DropdownMenuItem<String>>((
                                      String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList()),
                            ))
                      ],
                    ),

                    // Notification to +++++++++++++++++++++
                    Row(
                      children: [
                        Flexible(
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                child: const Text(
                                  'Thông tin quản lý thông báo nhận tin',
                                  style: TextStyle(fontSize: 12),
                                )))
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              height: 50.0,
                              child: TextField(
                                controller: txt_notification,
                                decoration: const InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: 'Notificate to',
                                ),
                              ),
                            ))
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
                                    child: const Text('Cập nhật'),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    onPressed: () {
                                      Navigator.pop(context);
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
                                    child: const Text('Hủy'),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  )))
                        ],
                      ),
                    ),

                  ],
                ))) // Here the scanned result will be shown
    );
  }
}
