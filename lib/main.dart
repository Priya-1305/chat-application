import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:priya/Auth/auth_gate.dart';
import 'package:priya/firebase_options.dart';
import 'package:priya/themes/theme_provider.dart';
import 'package:provider/provider.dart';
// import 'package:priya/Auth/loginOrRegister.dart';
// import 'package:priya/pages/register_page.dart';
// import 'pages/login_page.dart';
// import 'themes/light_dark_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const AuthGate(),
          theme: themeProvider.themeData,
        );
      },
    );
  }
}
