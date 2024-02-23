import 'package:flutter/material.dart';
import 'package:newone/screens/HomePage.dart';
// import 'package:newone/screens/controller/recipe_controller.dart';
// import 'package:newone/screens/controller/user_controller.dart';
// import 'package:newone/screens/details.dart';
import 'package:newone/screens/loginPage.dart';

// import 'package:newone/screens/view/recipe_viewPage.dart';
// import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import your RecipeProvider

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MaterialApp(
    home: isLoggedIn ? const HomePage() : const LoginPages(),
    routes: {
      '/login': (context) => const LoginPages(),
      '/home': (context) => const HomePage(),
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginPages(),
    );
  }
}