import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:flutter/services.dart';
import 'package:navigation_drawer/screens/home.dart';
import 'package:intl/intl.dart';

class DetailMachineScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DetailMachineScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  List<bool> isSelected = List.generate(3, (_)=> false);

  String result = "Hello World...!";

  Future _scanQR() async {
    try {
      String cameraScanResult = await scanner.scan();
      setState(() {
        result =
            cameraScanResult; // setting string result with cameraScanResult
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false, // set it to false
        appBar: AppBar(
          title: Text("TRẠNG THÁI HOẠT ĐỘNG MÁY"),
          centerTitle: true,
        ),
        body: Center(child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    // Code +++++++++++++++++++++
                    Row(
                      children: [
                        new Flexible(
                            child: new Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Mã máy (*)',
                                  style: TextStyle(fontSize: 12),
                                )))
                      ],
                    ),
                    Row(
                      children: [
                        new Flexible(
                            child: new Container(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            readOnly: true,
                            controller: nameController,
                            decoration: InputDecoration(
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
                        new Flexible(
                            child: new Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Diễn giải',
                                  style: TextStyle(fontSize: 12),
                                )))
                      ],
                    ),
                    Row(
                      children: [
                        new Flexible(
                            child: new Container(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Description',
                            ),
                          ),
                        ))
                      ],
                    ),
                    // Status +++++++++++++++++++++
                    Row(
                      children: [
                        new Flexible(
                            child: new Container(
                                padding: EdgeInsets.all(10),
                                child: ToggleButtons(
                                  children: <Widget>[
                                    Icon(Icons.ac_unit),
                                    Icon(Icons.call),
                                    Icon(Icons.cake),
                                  ],
                                  onPressed: (int index) {
                                    setState(() {
                                      for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                                        if (buttonIndex == index) {
                                          isSelected[buttonIndex] = true;
                                        } else {
                                          isSelected[buttonIndex] = false;
                                        }
                                      }
                                    });
                                  },
                                  isSelected: isSelected,
                                )))
                      ],
                    ),
                    // From date +++++++++++++++++++++
                    Row(children: [
                      new Flexible(
                          child: new Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Thời gian từ',
                                style: TextStyle(fontSize: 12),
                              )))
                    ]),
                    Row(
                      children: [
                        new Flexible(
                            child: new Container(
                                padding: EdgeInsets.all(10),
                                //height: 150,
                                child: Center(
                                    child: TextField(
                                  controller: dateinput,
                                  //editing controller of this TextField
                                  decoration: InputDecoration(
                                      icon: Icon(Icons.calendar_today),
                                      //icon of text field
                                      labelText:
                                          "From Date" //label text of field
                                      ),
                                  readOnly: true,
                                  //set it true, so that user will not able to edit text
                                  onTap: () async {
                                    DateTime pickedDate = await showDatePicker(
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
                                        dateinput.text =
                                            formattedDate; //set output date to TextField value.
                                      });
                                    } else {
                                      print("Date is not selected");
                                    }
                                  },
                                ))))
                      ],
                    ),
                    // To date +++++++++++++++++++++
                    Row(children: [
                      new Flexible(
                          child: new Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Thời gian đến',
                                style: TextStyle(fontSize: 12),
                              )))
                    ]),
                    Row(
                      children: [
                        new Flexible(
                            child: new Container(
                                padding: EdgeInsets.all(10),
                                //height: 150,
                                child: Center(
                                    child: TextField(
                                  controller: dateinput,
                                  //editing controller of this TextField
                                  decoration: InputDecoration(
                                      icon: Icon(Icons.calendar_today),
                                      //icon of text field
                                      labelText: "To Date" //label text of field
                                      ),
                                  readOnly: true,
                                  //set it true, so that user will not able to edit text
                                  onTap: () async {
                                    DateTime pickedDate = await showDatePicker(
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
                                        dateinput.text =
                                            formattedDate; //set output date to TextField value.
                                      });
                                    } else {
                                      print("Date is not selected");
                                    }
                                  },
                                ))))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //Center Row contents horizontally,
                      children: [
                        new Flexible(
                            child: new Container(
                                height: 50,
                                //padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                padding: EdgeInsets.all(10),
                                child: RaisedButton(
                                  textColor: Colors.white,
                                  color: Colors.blue,
                                  child: Text('Cập nhật'),
                                  onPressed: () {
                                    print(nameController.text);
                                    print(passwordController.text);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()),
                                    );
                                  },
                                ))),
                        new Flexible(
                            child: new Container(
                                height: 50,
                                //padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                padding: EdgeInsets.all(10),
                                child: RaisedButton(
                                  textColor: Colors.white,
                                  color: Colors.blue,
                                  child: Text('Hủy'),
                                  onPressed: () {
                                    print(nameController.text);
                                    print(passwordController.text);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()),
                                    );
                                  },
                                )))
                      ],
                    )
                  ],
                ))) // Here the scanned result will be shown
            ));
  }
}
