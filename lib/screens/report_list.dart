import 'package:flutter/material.dart';
import 'package:sakura/screens/report_001.dart';

class ReportListScreen extends StatelessWidget {
  static const String routeName = "/reportlist";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Danh sách báo cáo"),
      ),
      body: Container(
          child: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            ListTile(
              //tileColor: Color(0x9A9A9A72),
              //selectedTileColor: Colors.white,
              title: const Text("Báo cáo máy dừng"),
              subtitle:
                  const Text("Ngày, Ca, Nhân Viên, Bộ Phận, Người Quản Lý..."),
              leading: //Icon(Icons.request_page_outlined, color: Colors.blueGrey, size: 30,),
                  const CircleAvatar(
                      backgroundImage:
                          AssetImage("lib/assets/images/report2.png")),
              //const Image(image: AssetImage('lib/assets/images/report2.png')),
              trailing: const Icon(Icons.navigate_next_rounded),
              onTap: () {
                print("LISTTITE TEST");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Report_001_Screen(),
                    ),
                  );

                /*ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Chưa được kích hoạt')));*/
              },
            ),
            ListTile(
              //tileColor: Color(0x9A9A9A72),
              //selectedTileColor: Colors.white,
              title: const Text("Báo cáo hoạt động sản xuất"),
              subtitle: const Text("Ngày, Ca, Nhân Viên, Bộ Phận"),
              leading: const CircleAvatar(
                  backgroundImage: const AssetImage("lib/assets/images/report2.png")),
              //CircleAvatar(backgroundImage: AssetImage("assets/js.png")),
              trailing: const Icon(Icons.navigate_next_rounded),
              onTap: () {
                print("LISTTITE TEST");
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => YourNewPage(),
                    ),
                  );*/

                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Chưa được kích hoạt')));
              },
            ),
            ListTile(
              //tileColor: Color(0x9A9A9A72),
              //selectedTileColor: Colors.white,
              title: const Text("Báo cáo quản lý nhân viên"),
              subtitle: const Text("Ngày, Ca, Nhân Viên"),
              leading: const CircleAvatar(
                  backgroundImage: AssetImage("lib/assets/images/report2.png")),
              //CircleAvatar(backgroundImage: AssetImage("assets/js.png")),
              trailing: const Icon(Icons.navigate_next_rounded),
              onTap: () {
                print("LISTTITE TEST");
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => YourNewPage(),
                    ),
                  );*/

                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Chưa được kích hoạt')));
              },
            ),
            ListTile(
              //tileColor: Color(0x9A9A9A72),
              //selectedTileColor: Colors.white,
              title: const Text("Báo cáo tổng hợp"),
              subtitle: const Text("Ngày, Ca làm việc..."),
              leading: const CircleAvatar(
                  backgroundImage: AssetImage("lib/assets/images/report2.png")),
              //CircleAvatar(backgroundImage: AssetImage("assets/js.png")),
              trailing: const Icon(Icons.navigate_next_rounded),
              onTap: () {
                print("LISTTITE TEST");
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => YourNewPage(),
                    ),
                  );*/

                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Chưa được kích hoạt')));
              },
            ),
          ],
        ),
      )),
    );
  }
}
