// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:todoapp/screens/Task.dart';
// import 'package:todoapp/screens/home.dart';
//
//
// void main()async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'To-Do App',
//       theme: ThemeData.dark().copyWith(
//         scaffoldBackgroundColor: Colors.grey[900],
//         primaryColor: Colors.blue,
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Colors.black,
//         ),
//       ),
//       home:  CategoriesPage(),
//     );
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/screens/home.dart';
import 'package:todoapp/screens/llogiin.dart';
import 'package:todoapp/theme/darkandlight.dart';
import 'package:todoapp/utilitis/firbasehelper.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MultiProvider(providers:[
    // ChangeNotifierProvider(
    //     create: (context) => Themeprovider()),
    Provider<FirebaseHelper>(create: (_)=>FirebaseHelper( )),
    StreamProvider(create: (context)=> context.read<FirebaseHelper>().authState, initialData: null),



  ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'To-Do App',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: themeNotifier.themeMode,
            home: AuthWrapper(),
          );
        },
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          return CategoriesPage(uid: 'uid',); // Replace with your app's main page
        }
        return LoginPage();
      },
    );
  }
}


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Replace with your app's primary color
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle, size: 80, color: Colors.white), // Example logo
            const SizedBox(height: 20),
            const CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}

