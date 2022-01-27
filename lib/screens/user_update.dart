import 'package:flutter/material.dart';
import 'package:sakura/screens/home.dart';
import 'package:sakura/Model/user_model.dart';

class UserUpdateScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<UserUpdateScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  List<bool> isSelected = List.generate(3, (_) => false);

  TextEditingController txt_code = TextEditingController();
  TextEditingController txt_description = TextEditingController();
  TextEditingController txt_notification = TextEditingController();
  String dd_location = 'AMATA';
  String dd_model = 'FANUC';

  TextEditingController txt_user_name = TextEditingController();
  TextEditingController txt_full_name = TextEditingController();
  TextEditingController txt_email = TextEditingController();
  TextEditingController txt_address = TextEditingController();


  String result = "Hello World...!";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _User = ModalRoute
        .of(context)!
        .settings
        .arguments as User;

    txt_user_name.text = _User.user_name;
    txt_full_name.text = _User.full_name;
    txt_email.text = _User.email;
    txt_address.text = _User.address;

    return Scaffold(
        resizeToAvoidBottomInset: false, // set it to false
        appBar: AppBar(
          title: const Text("Cập nhật thông tin người dùng"),
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
                                  'User name (*)',
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
                                controller: txt_user_name,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Username (*)',
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
                                  'Họ và tên',
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
                                controller: txt_full_name,
                                decoration: const InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: 'Full name',
                                ),
                              ),
                            ))
                      ],
                    ),

                    // Email +++++++++++++++++++++
                    Row(
                      children: [
                        Flexible(
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                child: const Text(
                                  'Email',
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
                                controller: txt_email,
                                decoration: const InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: 'Email',
                                ),
                              ),
                            ))
                      ],
                    ),

                    // Address +++++++++++++++++++++
                    Row(
                      children: [
                        Flexible(
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                child: const Text(
                                  'Địa chỉ',
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
                                controller: txt_address,
                                decoration: const InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: 'Address',
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
