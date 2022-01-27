import 'package:flutter/material.dart';
import 'package:sakura/screens/user_update.dart';
import 'package:sakura/Model/user_model.dart';

class UserListScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<UserListScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  List<bool> isSelected = List.generate(3, (_) => false);

  bool _verticalList = true;
  ScrollController _scrollController = ScrollController();

  final _list_users = [
    {
      'user_id': 1,
      'user_name': 'HUNGLC',
      'password': 'AMATA',
      'full_name': 'Lê Hùng',
      'email': 'hunglc@gmail.com',
      'address': '123 Trần Phú, TP.HCM'
    },
    {
      'user_id': 2,
      'user_name': 'QUYNV',
      'password': 'AMATA',
      'full_name': 'Nguyễn Văn Quý',
      'email': 'quynv@gmail.com',
      'address': '123 Trần Phú, TP.HCM'
    },
    {
      'user_id': 3,
      'user_name': 'TRUONGNN',
      'password': 'AMATA',
      'full_name': 'Nguyễn Nhật Trường',
      'email': 'truongnn@gmail.com',
      'address': '123 Trần Phú, TP.HCM'
    },
  ];

  final _list_users_2 = [
    new User(1, "HUNGLC", "AMATA", "Lê Hùng", "hunglc@gmail.com",
        "123 Trần Phú, TP.HCM"),
    new User(2, "QUYNV", "AMATA", "Nguyễn Văn Quý", "quynv@gmail.com",
        "123 Trần Phú, TP.HCM"),
    new User(3, "TRUONGNN", "AMATA", "Nguyễn Nhật Trường", "truongnn@gmail.com",
        "123 Trần Phú, TP.HCM"),
  ];

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
          title: Text("Danh sách người dùng"),
          centerTitle: true,
        ),
        /*body: Container(
            child: ListView(
                    //shrinkWrap: true,
                    //scrollDirection: Axis.horizontal,
                    //physics: ClampingScrollPhysics(),
                    children: [_createDataTable()]))*/
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal, child: _createDataTable())));
  }

  DataTable _createDataTable() {
    return DataTable(
        showCheckboxColumn: false,
        sortAscending: true,
        columns: _createColumns(),
        rows: _createRows());
  }

  List<DataColumn> _createColumns() {
    return [
      const DataColumn(
          label:
              Text('User Name', style: TextStyle(fontWeight: FontWeight.bold))),
      const DataColumn(
          label:
              Text('Full Name', style: TextStyle(fontWeight: FontWeight.bold))),
      const DataColumn(
          label: Text('Email', style: TextStyle(fontWeight: FontWeight.bold))),
      const DataColumn(
          label: Text('Address', style: TextStyle(fontWeight: FontWeight.bold)))
    ];
  }

  List<DataRow> _createRows() {
    return _list_users_2
        .map((user) => DataRow(
                cells: [
                  DataCell(Text(user.user_name.toString())),
                  DataCell(Text(user.full_name.toString())),
                  DataCell(Text(user.email.toString())),
                  DataCell(Text(user.address.toString()))
                ],
                onSelectChanged: (e) {
                  print(user.user_name.toString());
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailMachineScreen()),
                  );*/

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserUpdateScreen(),
                      // Pass the arguments as part of the RouteSettings. The
                      // DetailScreen reads the arguments from these settings.
                      settings: RouteSettings(
                        arguments: user, //.user_name.toString(),
                      ),
                    ),
                  );
                }))
        .toList();
  }
}
