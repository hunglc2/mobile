import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sakura/screens/home.dart';
import 'package:intl/intl.dart';
import 'package:sakura/Model/machine_model.dart';

class MachineScanScreen extends StatefulWidget {
  const MachineScanScreen({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MachineScanScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  List<bool> isSelected = List.generate(4, (_) => false);

  TextEditingController txt_code = TextEditingController();
  TextEditingController txt_description  = TextEditingController();
  TextEditingController txt_from_date = TextEditingController();
  TextEditingController txt_to_date = TextEditingController();

  String result = "Hello World...!";

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final code = ModalRoute.of(context)!.settings.arguments as String;

    txt_code.text = code; //machine.code.toString();
    //isSelected[0] = true;

    return Scaffold(
        resizeToAvoidBottomInset: false, // set it to false
        appBar: AppBar(
          title: const Text("Trạng thái hoạt động máy"),
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
                              border: const OutlineInputBorder(),
                              labelText: 'Code (*)',
                            ),
                          ),
                        ))
                      ],
                    ),
                    // Status +++++++++++++++++++++
                    Row(
                      children: [
                        Flexible(
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                                height: 50.0,
                                child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: ToggleButtons(
                                      selectedColor: Colors.white,
                                      fillColor: Colors.blueGrey,
                                      children: const <Widget>[
                                        /*Icon(Icons.ac_unit),
                                    Icon(Icons.call),
                                    Icon(Icons.cake),
                                    Icon(Icons.alarm),*/
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 25.0, right: 25.0),
                                            child: Text('Hoạt động',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 25.0, right: 25.0),
                                            child: Text('Ngừng chạy',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 25.0, right: 25.0),
                                            child: Text('Bất thường',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 25.0, right: 25.0),
                                            child: Text('Tắt máy',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)))
                                      ],
                                      onPressed: (int index) {
                                        setState(() {
                                          for (int buttonIndex = 0;
                                              buttonIndex < isSelected.length;
                                              buttonIndex++) {
                                            if (buttonIndex == index) {
                                              isSelected[buttonIndex] = true;
                                              print('Toggle Button index: ' +
                                                  index.toString());
                                            } else {
                                              isSelected[buttonIndex] = false;
                                            }
                                          }
                                        });
                                      },
                                      isSelected: isSelected,
                                    ))))
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
                              border: OutlineInputBorder(),
                              labelText: 'Description',
                            ),
                          ),
                        ))
                      ],
                    ),
                    // From date +++++++++++++++++++++
                    Row(children: [
                      Flexible(
                          child: Container(
                              padding: const EdgeInsets.all(5),
                              //height: 50.0,
                              child: const Text(
                                'Thời gian từ',
                                style: TextStyle(fontSize: 12),
                              )))
                    ]),
                    Row(
                      children: [
                        Flexible(
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                height: 50.0,
                                //height: 150,
                                child: Center(
                                    child: TextField(
                                  controller: txt_from_date,
                                  //editing controller of this TextField
                                  decoration: const InputDecoration(
                                      icon: const Icon(Icons.calendar_today),
                                      //icon of text field
                                      labelText:
                                          "From Date" //label text of field
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
                                        txt_from_date.text =
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
                      Flexible(
                          child: Container(
                              padding: const EdgeInsets.all(5),
                              //height: 50.0,
                              child: const Text(
                                'Thời gian đến',
                                style: const TextStyle(fontSize: 12),
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
                                      labelText: "To Date" //label text of field
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
                                    child: const Text('Cập nhật'),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    onPressed: () {
                                      print(txt_code.text);
                                      print(txt_description.text);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomeScreen()),
                                      );
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    onPressed: () {
                                      print(txt_code.text);
                                      print(txt_description.text);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomeScreen()),
                                      );
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
