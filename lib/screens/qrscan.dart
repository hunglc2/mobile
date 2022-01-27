import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:flutter/services.dart';
import 'package:navigation_drawer/screens/detail_machine.dart';

class QRScanScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<QRScanScreen> {
  String result = "Hello World...!";
  Future _scanQR() async {
    try {
      String cameraScanResult = await scanner.scan();
      setState(() {
        result = cameraScanResult; // setting string result with cameraScanResult
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Scanner"),
      ),
      body: Center(
        child: Text(result), // Here the scanned result will be shown
      ),
      floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.camera_alt),
          onPressed: () {
            //_scanQR(); // calling a function when user click on button
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailMachineScreen()),
            );
          },
          label: Text("Scan")),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}