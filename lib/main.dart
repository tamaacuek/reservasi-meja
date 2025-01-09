import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:tama_app/model/cart_model.dart';
import 'firebase_options.dart';
import 'pages/loginPage.dart';

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
      create: (context) => CartModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );

    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Flutter Firebase Auth',
    //   theme: ThemeData(
    //     primarySwatch: Colors.deepPurple,
    //   ),
    //   home: const LoginPage(),
    // );
  }
}
