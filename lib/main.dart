import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_project/src/injection/dependency_injection.dart';
import 'package:my_theme/app_theme_provider.dart';
import 'package:provider/provider.dart';

import 'component_settings.dart';
import 'locators.dart';
import 'services/user_data_service.dart';

void main() {
  Injector.configure(Flavor.prod);

  WidgetsFlutterBinding.ensureInitialized();

  ///Set preferred orientation to portrait
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  setupLocators();
  //Network().callAPI(RequestType.get, Uri.parse(''));
  runApp(
    MultiProvider(
      /// List of provider, the UI updates when `notifyListeners()` is called
      /// on the service classes
      /// learn more: https://pub.dev/packages/provider
      providers: [
        ChangeNotifierProvider(create: (_) => locator<UserDataService>()),
        ChangeNotifierProvider<AppThemeProvider>(
            create: (_) => AppThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeProvider>(
      builder: (context, AppThemeProvider notifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: notifier.isDark,
          home: ComponentSetting(),
        );
      },
    );
  }
}
