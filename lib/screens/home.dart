import 'package:flutter/material.dart';
import 'package:navigation_drawer/screens/account.dart';
import 'package:navigation_drawer/screens/settings.dart';
import 'package:navigation_drawer/screens/qrscan.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Drawer getNavDrawer(BuildContext context) {
    var headerChild = DrawerHeader(child: Text("Menu"));
    var aboutChild = AboutListTile(
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
      getNavItem(Icons.view_sidebar_outlined, "Quản lý hệ thống máy",
          AccountScreen.routeName),
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
                MaterialPageRoute(builder: (context) => QRScanScreen()),
              );
              /*ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a Scan QR CODE')));*/
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: 'Go to the next page',
            onPressed: () {
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
            },
          ),
        ],
      ),
      // body: Container(
      //     child: Center(
      //   child: Text("Home Screen"),
      // ))
      body: Column(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Icon(Icons.kitchen, color: Colors.red[500], size: 100),
                const Text('PREP:'),
                const Text('25 min'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.timer, color: Colors.green[500], size: 100),
                const Text('COOK:'),
                const Text('1 hr'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.restaurant, color: Colors.green[500], size: 100),
                const Text('FEEDS:'),
                const Text('4-6'),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // children: [
          //   const Image(image: AssetImage('images/logo-sakura.jpg'), width: 100.0, height: 100.0)
          // ],
          children: [
            Column(
              children: [
                Icon(Icons.kitchen, color: Colors.red[500], size: 100),
                const Text('PREP:'),
                const Text('25 min'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.timer, color: Colors.green[500], size: 100),
                const Text('COOK:'),
                const Text('1 hr'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.restaurant, color: Colors.green[500], size: 100),
                const Text('FEEDS:'),
                const Text('4-6'),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // children: [
          //   const Image(image: AssetImage('images/logo-sakura.jpg'), width: 100.0, height: 100.0)
          // ],
          children: [
            Column(
              children: [
                Icon(Icons.kitchen, color: Colors.red[500], size: 100),
                const Text('PREP:'),
                const Text('25 min'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.timer, color: Colors.green[500], size: 100),
                const Text('COOK:'),
                const Text('1 hr'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.restaurant, color: Colors.green[500], size: 100),
                const Text('FEEDS:'),
                const Text('4-6'),
              ],
            ),
          ],
        )
      ]),
      // Set the nav drawer
      drawer: getNavDrawer(context),
    );
  }
}
