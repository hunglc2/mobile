import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sakura/screens/account.dart';
import 'package:sakura/screens/settings.dart';
import 'package:sakura/screens/machine_list.dart';
import 'package:sakura/screens/user_list.dart';
import 'package:sakura/screens/notification_list.dart';
import 'package:sakura/screens/report.dart';
import 'package:sakura/screens/qr_scan.dart';
import 'package:sakura/screens/report_list.dart';




class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Drawer getNavDrawer(BuildContext context) {
    var headerChild = const DrawerHeader(child: Text("Menu"));
    var aboutChild = const AboutListTile(
        child: Text("About"),
        applicationName: "Application Name",
        applicationVersion: "v1.0.0",
        applicationIcon: Icon(Icons.adb),
        icon: Icon(Icons.info));

    ListTile getNavItem(var icon, String s, String routeName) {
      return ListTile(
        leading: Icon(icon),
        title: Text(s),
        onTap: () {
          setState(() {
            // pop closes the drawer
            Navigator.of(context).pop();
            // navigate to the route
            Navigator.of(context).pushNamed(routeName);
          });
        },
      );
    }

    var myNavChildren = [
      headerChild,
      getNavItem(Icons.home, "Trang chủ", "/"),
      getNavItem(Icons.account_box, "Tài khoản", AccountScreen.routeName),
      getNavItem(Icons.settings, "Cài đặt", SettingsScreen.routeName),
      aboutChild
    ];

    ListView listView = ListView(children: myNavChildren);

    return Drawer(
      child: listView,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SAKURA"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.qr_code),
              tooltip: 'Scan QR CODE',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QRViewScreen()),//QRScanScreen()),
                );
                /*ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a Scan QR CODE')));*/
              },
            ),
            IconButton(
              icon: const Icon(Icons.notifications_active),
              tooltip: 'Go to the notification',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationScreen()),
                );
                /*ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a Scan QR CODE')));*/
              },
              /*onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: const Text('Next page'),
                      ),
                      body: const Center(
                        child: Text(
                          'This is the next page',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    );
                  },
                ));
              },*/
            ),
          ],
        ),
        // body: Container(
        //     child: Center(
        //   child: Text("Home Screen"),
        // ))
        body: Column(children: [
          Expanded(
              child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(15),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        //icon: const Icon(Icons.volume_up),
                        icon: SvgPicture.asset("lib/assets/images/machine.svg",
                            color: Colors.blueGrey,
                            semanticsLabel: 'A red up arrow'),
                        //Image(image: AssetImage('assets/images/qrcode.svg')),
                        tooltip: 'Hệ thống máy',
                        iconSize: 50,
                        onPressed: () {
                          setState(() {
                            print('click Scan QR Code');
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MachineListScreen()),
                            );
                          });
                        },
                      ),
                      Text('Hệ thống máy')
                    ],
                  ))),
              Container(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            //icon: const Icon(Icons.volume_up),
                            icon: SvgPicture.asset("lib/assets/images/report.svg",
                                color: Colors.blueGrey,
                                semanticsLabel: 'A red up arrow'),
                            //Image(image: AssetImage('assets/images/qrcode.svg')),
                            tooltip: 'Báo cáo',
                            iconSize: 50,
                            onPressed: () {
                              setState(() {
                                print('click report');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ReportListScreen()),
                                );
                              });
                            },
                          ),
                          Text('Báo cáo')
                        ],
                      ))),
              Container(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        //icon: const Icon(Icons.volume_up),
                        icon: SvgPicture.asset("lib/assets/images/user.svg",
                            color: Colors.blueGrey,
                            semanticsLabel: 'A red up arrow'),
                        //Image(image: AssetImage('assets/images/qrcode.svg')),
                        tooltip: 'Người dùng',
                        iconSize: 50,
                        onPressed: () {
                          setState(() {
                            print('click ListUserScreen');
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => UserListScreen()),
                            );
                          });
                        },
                      ),
                      Text('Người dùng')
                    ],
                  ))),
              Container(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        //icon: const Icon(Icons.volume_up),
                        icon: SvgPicture.asset("lib/assets/images/tools.svg",
                            color: Colors.blueGrey,
                            semanticsLabel: 'A red up arrow'),
                        //Image(image: AssetImage('assets/images/qrcode.svg')),
                        tooltip: 'Tiện ích',
                        iconSize: 100,
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Tiện ích chưa được kích hoạt')));
                        },
                      ),
                      Text('Tiện ích')
                    ],
                  ))),
              Container(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        //icon: const Icon(Icons.volume_up),
                        icon: SvgPicture.asset("lib/assets/images/setting.svg",
                            color: Colors.blueGrey,
                            semanticsLabel: 'A red up arrow'),
                        //Image(image: AssetImage('assets/images/qrcode.svg')),
                        tooltip: 'Cài đặt',
                        iconSize: 100,
                        onPressed: () {
                          setState(() {
                            print('click SettingsScreen');
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SettingsScreen()),
                            );
                          });
                        },
                      ),
                      Text('Cài đặt')
                    ],
                  ))),
              Container(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        //icon: const Icon(Icons.volume_up),
                        icon: SvgPicture.asset("lib/assets/images/update.svg",
                            color: Colors.blueGrey,
                            semanticsLabel: 'A red up arrow'),
                        //Image(image: AssetImage('assets/images/qrcode.svg')),
                        tooltip: 'Cập nhật',
                        iconSize: 100,
                        onPressed: () async {
                          //List<StorageInfo> storageInfo = await PathProviderEx.getStorageInfo();
                          /*downloadFile("https://gaudev.com",
                              "app-release.apk", storageInfo[0].rootDir);*/
                          /*downloadFile("https://gaudev.com",
                              "app-release.apk", "file://Internal storage/Download");*/

                          _downloadFile("https://gaudev.com/app-release.apk", "app-release.apk");
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Version 1.0 - Chưa có phiên bản mới được cập nhật')));
                        },
                      ),
                      Text('Cập nhật')
                    ],
                  )))
            ],
          )),
          /*Expanded(
              child: Column(children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Revolution is coming...'),
                    color: Colors.teal[500],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Revolution, they...'),
                    color: Colors.teal[600],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Revolution, they...'),
                    color: Colors.teal[600],
                  )
                ],
              )),*/
        ]),
        // Set the nav drawer
        //drawer: getNavDrawer(context),
        drawer: getNavDrawer(context));
  }
}


var httpClient = HttpClient();
Future<File> _downloadFile(String url, String filename) async {
  var request = await httpClient.getUrl(Uri.parse(url));
  var response = await request.close();
  var bytes = await consolidateHttpClientResponseBytes(response);
  String dir = (await getApplicationDocumentsDirectory()).path;
  File file = File('$dir/$filename');
  await file.writeAsBytes(bytes);
  return file;
}

Future<String> downloadFile(String url, String fileName, String dir) async {
  HttpClient httpClient = new HttpClient();
  File file;
  String filePath = '';
  String myUrl = '';

  try {
    myUrl = url+'/'+fileName;
    var request = await httpClient.getUrl(Uri.parse(myUrl));
    var response = await request.close();
    if(response.statusCode == 200) {
      var bytes = await consolidateHttpClientResponseBytes(response);
      filePath = '$dir/$fileName';
      file = File(filePath);
      await file.writeAsBytes(bytes);
    }
    else
      filePath = 'Error code: '+response.statusCode.toString();
  }
  catch(ex){
    filePath = 'Can not fetch url';
    print("xxxxxxxxxxxxxxxxx " + filePath);
  }

  print("xxxxxxxxxxxxxxxxx " + filePath);
  return filePath;
}