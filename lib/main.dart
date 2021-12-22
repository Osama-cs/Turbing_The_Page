import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:individualproject/db/firebaseservices.dart';
import 'package:individualproject/src/homepage.dart';
import 'package:provider/provider.dart';
import 'src/loginpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<FirebaseService>(
            create: (_) => FirebaseService(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) =>
                context.read<FirebaseService>().authStateChanges,
            initialData: User,
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
            fontFamily: 'Inter',
          ),
          home: LoginPage(),
        ));
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = context.watch<User>();

    if (user != null) {
      return HomePage();
    }
    return LoginPage();
  }
}
