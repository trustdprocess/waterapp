import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waterapp/firebase_options.dart';
import 'package:waterapp/login/login.dart';
import 'package:waterapp/loginmethods/google.dart';
import 'package:waterapp/routes/routes.dart';
import 'package:waterapp/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized.
  await Firebase.initializeApp(); // Initialize Firebase.

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>themeChanger())
      ],
      child: MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme=Provider.of<themeChanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthService().AuthState(),
     
      
      initialRoute: "/",
      onGenerateRoute:RouteGenerator.generateRoute ,
      theme:theme.defaultTheme ,
    );
  }
}
