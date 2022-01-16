import 'package:being_helpful/scr/providers/auth.dart';
import 'package:being_helpful/scr/screens/home.dart';
import 'package:being_helpful/scr/screens/login.dart';
import 'package:being_helpful/scr/screens/registration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'firebase';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyBl2BInlFMP6qV9sOKl7GwJVFfndKFCe5A",
        appId: "1:404721041411:android:b1353c7e88485fc2944e36",
        projectId: "being-helpful",
        messagingSenderId: '404721041411'),
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: AuthProvider.initialize()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const ScreenController(),
    ),
  ));
}

class ScreenController extends StatelessWidget {
  const ScreenController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    switch (auth.status) {
      //TODO: uncomment the below line of loading screen
      //TODO: uncomment default to loginScreen from registrationscreen
      case Status.Unintiallized:
      // return const Loading();
      case Status.Authenticating:
        return const LoginScreen();
      case Status.Unauthenciated:
      case Status.Authenticated:
        return const Home();
      default:
        // return const LoginScreen();
        return const RegistrationScreen();
    }
  }
}

//we arent calling myApp directly
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const LoginScreen(),
    );
  }
}
