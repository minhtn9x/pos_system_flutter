import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_pos/providers/app_provider.dart';
import 'package:restaurant_pos/screens/splash.dart';
import 'package:restaurant_pos/util/const.dart';

import 'util/const.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAcPibRz6czg0x3qVt9_vRKkH9-LSgyhh8",
      appId: "1:989019724079:android:34600346cfc88de54769da",
      messagingSenderId: "989019724079",
      projectId: "flutter-login-29229",
    ),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (BuildContext context, AppProvider appProvider, Widget child) {
        return MaterialApp(
          key: appProvider.key,
          debugShowCheckedModeBanner: false,
          navigatorKey: appProvider.navigatorKey,
          title: Constants.appName,
          theme: appProvider.theme,
          darkTheme: Constants.darkTheme,
          home: SplashScreen(),
        );
      },
    );
  }
}