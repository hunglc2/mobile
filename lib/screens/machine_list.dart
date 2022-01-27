import 'package:flutter/material.dart';
import 'package:sakura/screens/machine_detail.dart';
import 'package:sakura/Model/machine_model.dart';

class MachineListScreen extends StatefulWidget {
  late final List<Machine> _machines;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MachineListScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  List<bool> isSelected = List.generate(3, (_) => false);

  String result = "Hello World...!";

  final _list_machines = [
    {
      'code': '100',
      'model': 'FUNUC',
      'location': 'AMATA',
      'notification_list': 'QuyNV'
    },
    {
      'code': '101',
      'model': 'FUNUC',
      'location': 'AMATA',
      'notification_list': 'QuyNV'
    },
    {
      'code': '102',
      'model': 'FUNUC',
      'location': 'AMATA',
      'notification_list': 'QuyNV'
    },
    {
      'code': '103',
      'model': 'NISSEI',
      'location': 'AMATA',
      'notification_list': 'QuyNV'
    },
    {
      'code': '104',
      'model': 'NISSEI',
      'location': 'AMATA',
      'notification_list': 'QuyNV'
    },
    {
      'code': '105',
      'model': 'Sumitomo',
      'location': 'AMATA',
      'notification_list': 'QuyNV'
    },
    {
      'code': '106',
      'model': 'Sumitomo',
      'location': 'AMATA',
      'notification_list': 'DanhNT'
    },
    {
      'code': '107',
      'model': 'FUNUC',
      'location': 'Thủ Đức',
      'notification_list': 'DanhNT'
    },
    {
      'code': '108',
      'model': 'FUNUC',
      'location': 'Thủ Đức',
      'notification_list': 'QuyNV'
    },
    {
      'code': '109',
      'model': 'Thủ Đức',
      'location': 'AMATA',
      'notification_list': 'QuyNV'
    },
    {
      'code': '110',
      'model': 'FUNUC',
      'location': 'Bình dương',
      'notification_list': 'DanhNT'
    },
    {
      'code': '111',
      'model': 'FUNUC',
      'location': 'Bình dương',
      'notification_list': 'DanhNT'
    },
    {
      'code': '112',
      'model': 'FUNUC',
      'location': 'Bình dương',
      'notification_list': 'DanhNT'
    },
    {
      'code': '113',
      'model': 'FUNUC',
      'location': 'Bình dương',
      'notification_list': 'DanhNT'
    },
    {
      'code': '114',
      'model': 'FUNUC',
      'location': 'Bình dương',
      'notification_list': 'DanhNT'
    },
    {
      'code': '115',
      'model': 'FUNUC',
      'location': 'Bình dương',
      'notification_list': 'DanhNT'
    },
    {
      'code': '116',
      'model': 'FUNUC',
      'location': 'Bình dương',
      'notification_list': 'DanhNT'
    },
    {
      'code': '117',
      'model': 'FUNUC',
      'location': 'Bình dương',
      'notification_list': 'DanhNT'
    },
    {
      'code': '118',
      'model': 'FUNUC',
      'location': 'Bình dương',
      'notification_list': 'DanhNT'
    },
    {
      'code': '119',
      'model': 'FUNUC',
      'location': 'Bình dương',
      'notification_list': 'DanhNT'
    }
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
          title: Text("Danh sách hệ thống máy"),
          centerTitle: true,
        ),
        /*body: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
          //shrinkWrap: true,
          //scrollDirection: Axis.horizontal,
          //physics: ClampingScrollPhysics(),
            children: [_createDataTable()]));*/

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
          label: Text('Mã máy', style: TextStyle(fontWeight: FontWeight.bold))),
      const DataColumn(
          label: Text('Model', style: TextStyle(fontWeight: FontWeight.bold))),
      const DataColumn(
          label: Text('Xưởng', style: TextStyle(fontWeight: FontWeight.bold))),
      const DataColumn(
          label:
              Text('Thông báo', style: TextStyle(fontWeight: FontWeight.bold)))
    ];
  }

  List<DataRow> _createRows() {
    return _list_machines
        .map((machine) => DataRow(
                cells: [
                  DataCell(Text('#' + machine['code'].toString())),
                  DataCell(Text(machine['model'].toString())),
                  DataCell(Text(machine['location'].toString())),
                  DataCell(Text(machine['notification_list'].toString()))
                ],
                onSelectChanged: (e) {
                  print(machine['code'].toString());
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailMachineScreen()),
                  );*/

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MachineDetailScreen(),
                      // Pass the arguments as part of the RouteSettings. The
                      // DetailScreen reads the arguments from these settings.
                      settings: RouteSettings(
                        arguments: machine['code'].toString(),
                      ),
                    ),
                  );
                }))
        .toList();

    /*return [
    const DataRow(cells: [
      DataCell(Text('#100')),
      DataCell(Text('FUNUC')),
      DataCell(Text('AMATA')),
      DataCell(Text('QuyNV, DanhNT'))
    ]),
    const DataRow(cells: [
      DataCell(Text('#101')),
      DataCell(Text('Samitomo')),
      DataCell(Text('Bình dương')),
      DataCell(Text('QuyNV, DanhNT'))
    ]),
    const DataRow(cells: [
      DataCell(Text('#102')),
      DataCell(Text('FUNUC')),
      DataCell(Text('AMATA')),
      DataCell(Text('QuyNV, DanhNT'))
    ]),
    const DataRow(cells: [
      DataCell(Text('#103')),
      DataCell(Text('FUNUC')),
      DataCell(Text('AMATA')),
      DataCell(Text('QuyNV, DanhNT'))
    ]),
    const DataRow(cells: [
      DataCell(Text('#104')),
      DataCell(Text('FUNUC')),
      DataCell(Text('AMATA')),
      DataCell(Text('QuyNV, DanhNT'))
    ]),
    const DataRow(cells: [
      DataCell(Text('#105')),
      DataCell(Text('Samitomo')),
      DataCell(Text('Bình dương')),
      DataCell(Text('QuyNV, DanhNT'))
    ]),
    const DataRow(cells: [
      DataCell(Text('#106')),
      DataCell(Text('Samitomo')),
      DataCell(Text('Bình dương')),
      DataCell(Text('QuyNV, DanhNT'))
    ]),
    const DataRow(cells: [
      DataCell(Text('#107')),
      DataCell(Text('Samitomo')),
      DataCell(Text('Bình dương')),
      DataCell(Text('QuyNV, DanhNT'))
    ]),
    const DataRow(cells: [
      DataCell(Text('#107')),
      DataCell(Text('Samitomo')),
      DataCell(Text('Bình dương')),
      DataCell(Text('QuyNV, DanhNT'))
    ]),
    const DataRow(cells: [
      DataCell(Text('#108')),
      DataCell(Text('Samitomo')),
      DataCell(Text('Thủ Đức')),
      DataCell(Text('QuyNV, DanhNT'))
    ]),
    const DataRow(cells: [
      DataCell(Text('#109')),
      DataCell(Text('Samitomo')),
      DataCell(Text('Thủ Đức')),
      DataCell(Text('QuyNV, DanhNT'))
    ]),
    const DataRow(cells: [
      DataCell(Text('#110')),
      DataCell(Text('Samitomo')),
      DataCell(Text('Thủ Đức')),
      DataCell(Text('QuyNV, DanhNT'))
    ]),
    const DataRow(cells: [
      DataCell(Text('#111')),
      DataCell(Text('Samitomo')),
      DataCell(Text('Thủ Đức')),
      DataCell(Text('QuyNV, DanhNT'))
    ]),
  ];*/
  }
}
