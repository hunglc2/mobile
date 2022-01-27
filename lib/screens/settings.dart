import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = "/settings";
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cài đặt"),
        ),
        body: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Colors.white.withOpacity(.94),
            /*appBar: AppBar(
              title: Text(
                "Settings",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),*/
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [
                  // user card
                  /*SimpleUserCard(
                    userName: "Nom de l'utilisateur",
                    userProfilePic: AssetImage("assets/profilpic.png"),
                  ),*/
                  SettingsGroup(
                    items: [
                      SettingsItem(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Chưa được kích hoạt')));
                        },
                        icons: CupertinoIcons.pencil_outline,
                        iconStyle: IconStyle(),
                        title: 'Ngôn ngữ',
                        subtitle: "Chọn ngôn ngữ của bạn",
                      ),
                      SettingsItem(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Chưa được kích hoạt')));
                        },
                        icons: Icons.fingerprint,
                        iconStyle: IconStyle(
                          iconsColor: Colors.white,
                          withBackground: true,
                          backgroundColor: Colors.red,
                        ),
                        title: 'Xác thực vân tay',
                        subtitle: "Khóa để cải thiện quyền riêng tư của bạn",
                      ),
                      SettingsItem(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Chưa được kích hoạt')));
                          },
                          icons: Icons.dark_mode_rounded,
                          iconStyle: IconStyle(
                            iconsColor: Colors.white,
                            withBackground: true,
                            backgroundColor: Colors.red,
                          ),
                          title: 'Dark mode',
                          subtitle: "Tự động",
                          trailing: Switch.adaptive(
                              value: isSwitched,
                              onChanged: (value) {
                                isSwitched = value;
                                print(isSwitched);
                              })),
                    ],
                  ),
                  SettingsGroup(
                    items: [
                      SettingsItem(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Chưa được kích hoạt')));
                        },
                        icons: Icons.info_rounded,
                        iconStyle: IconStyle(
                          backgroundColor: Colors.purple,
                        ),
                        title: 'Giới thiệu',
                        subtitle: "Giới thiệu về ứng dụng",
                      ),
                    ],
                  ),
                  // You can add a settings title
                  SettingsGroup(
                    settingsGroupTitle: "Tài khoản",
                    items: [
                      SettingsItem(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Chưa được kích hoạt')));
                        },
                        icons: Icons.exit_to_app_rounded,
                        title: "Đăng xuất",
                      ),
                      SettingsItem(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Chưa được kích hoạt')));
                        },
                        icons: CupertinoIcons.repeat,
                        title: "Thay đổi email",
                      ),
                      SettingsItem(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Chưa được kích hoạt')));
                        },
                        icons: CupertinoIcons.delete_solid,
                        title: "Xóa tài khoản",
                        titleStyle: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
