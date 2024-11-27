import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_store/models/user_manager.dart';
import 'package:new_store/screens/screns_base/base_screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:new_store/screens/screns_base/login.dart';
import 'package:new_store/screens/screns_base/sign_up.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      lazy: false,
      create: (context) => UserManager(),
      child: MaterialApp(
        initialRoute: '/base',
        theme: ThemeData(
            primaryColor: const Color.fromARGB(255, 4, 125, 141),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            scaffoldBackgroundColor: const Color.fromARGB(255, 4, 125, 141)),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/signup':
              return MaterialPageRoute(builder: (_) => const SignUp());
            case '/login':
              return MaterialPageRoute(builder: (_) => Login());
            case '/base':
            default:
              return MaterialPageRoute(builder: (_) => BaseScreens());
          }
        },
      ),
    );
  }
}
