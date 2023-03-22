import 'package:flutter/material.dart';
import 'package:my_theme/app_theme_provider.dart';
import 'package:my_theme/theme_menu.dart';
import 'package:provider/provider.dart';

class ComponentSetting extends StatelessWidget {
  ComponentSetting({super.key});

  final List<String> themeName = themeMap.values.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView.separated(
            itemCount: themeName.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  context.read<AppThemeProvider>().toggleTheme(index);
                  Navigator.pop(context);
                },
                title: Text(themeName[index]),
              );
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
        child: Column(
          children: [
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Click On ElevatedButton')));
                  },
                  child: const Center(child: Text('ElevatedButton'))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Click On ElevatedButton')));
                  },
                  child: const Center(child: Text('TextButton'))),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: CheckboxListTile(
                  value: true,
                  onChanged: null,
                  title: Text('This is checkbox!'),
                  controlAffinity: ListTileControlAffinity.leading,
                  visualDensity: VisualDensity.compact,
                  dense: true,
                  contentPadding: EdgeInsets.zero),
            ),
          ],
        ),
      ),
    );
  }
}
