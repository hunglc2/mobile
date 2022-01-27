import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  static const String routeName = "/notification";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông báo"),
      ),
      body: Container(
          child: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            ListTile(
                //tileColor: Color(0x9A9A9A72),
                //selectedTileColor: Colors.white,
                title: Text("Máy 101 (30T) - Model FANUC - Không có KHCM"),
                subtitle: Text("04/01/2022 12:30"),
                leading:Icon(Icons.notifications_active, color: Colors.blueGrey, size: 30,),
                    //CircleAvatar(backgroundImage: AssetImage("assets/js.png")),
                trailing: Icon(Icons.navigate_next_rounded),
                onTap: () { print("LISTTITE TEST");
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => YourNewPage(),
                    ),
                  );*/
                },
            ),
            const ListTile(
            //tileColor: Color(0x9A9A9A72),
            //selectedTileColor: Colors.white,
            title: Text("Máy 102 (60T) - Model FANUC - Không có KHCM"),
            subtitle: Text("03/01/2022 12:30"),
            leading:Icon(Icons.notifications_active, color: Colors.blueGrey, size: 30,),
            //CircleAvatar(backgroundImage: AssetImage("assets/js.png")),
            trailing: Icon(Icons.navigate_next_rounded)),
            ListTile(
            //tileColor: Color(0x9A9A9A72),
            //selectedTileColor: Colors.white,
            title: Text("Máy 103 (60T) - Model FANUC - Không có KHCM"),
            subtitle: Text("02/01/2022 14:20"),
            leading:Icon(Icons.notifications_active, color: Colors.blueGrey, size: 30,),
            //CircleAvatar(backgroundImage: AssetImage("assets/js.png")),
            trailing: Icon(Icons.navigate_next_rounded)),
            ListTile(
                //tileColor: Color(0x9A9A9A72),
                //selectedTileColor: Colors.white,
                title: Text("Máy 104 (30T) - Model FANUC - Không có KHCM"),
                subtitle: Text("01/01/2022 17:00"),
                leading:Icon(Icons.notifications_active, color: Colors.blueGrey, size: 30,),
                //CircleAvatar(backgroundImage: AssetImage("assets/js.png")),
                trailing: Icon(Icons.navigate_next_rounded)),
          ],
        ),
      )),
    );
  }
}
