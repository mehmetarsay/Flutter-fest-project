import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zam/core/init/cache/locale_manager.dart';
import 'package:zam/screens/splash/splash_view.dart';
import 'package:provider/provider.dart';
import 'core/init/provider/provider_list.dart';
import 'core/init/provider/theme_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [...ApplicationProvider.instance!.dependItems],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zam',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeNotifier>(context).currentTheme,
      home: const SplashView(),
    );
  }
}
