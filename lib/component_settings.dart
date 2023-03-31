import 'package:flutter/material.dart';
import 'package:flutter_demo_project/views/tab_one.dart';
import 'package:flutter_demo_project/views/tab_two.dart';
import 'package:my_theme/app_theme_provider.dart';
import 'package:my_theme/theme_menu.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ComponentSetting extends StatefulWidget {
  const ComponentSetting({super.key});

  @override
  State<ComponentSetting> createState() => _ComponentSettingState();
}

class _ComponentSettingState extends State<ComponentSetting> {
  final List<String> themeName = themeMap.values.toList();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 4.h),
            child: TabBar(tabs: [
              Tab(
                child: Text(
                  'Home',
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
              Tab(
                child: Text(
                  'Notification',
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
            ]),
          ),
        ),
        drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.80,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text(
                  "Dipesh Jethva",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                accountEmail: Text(
                  "dipesh@jbktechnologies.com",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                currentAccountPicture: FlutterLogo(),
              ),
              ExpansionTile(
                title: const Text('Theme'),
                children: [
                  ListView.separated(
                      padding: EdgeInsets.zero,
                      itemCount: themeName.length,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) {
                        return ListTile(
                          visualDensity: VisualDensity.compact,
                          minVerticalPadding: 2,
                          dense: true,
                          onTap: () {
                            context.read<AppThemeProvider>().toggleTheme(index);
                            Navigator.pop(context);
                          },
                          title: Text(themeName[index]),
                        );
                      })
                ],
              )
            ],
          ),
        ),
        body: const TabBarView(children: [TabOne(), TabTwo()]),
      ),
    );
  }
}
