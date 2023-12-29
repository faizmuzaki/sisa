import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sisa/firebase_options.dart';
import 'package:sisa/screens/cheapest_restaurants.dart';
import 'package:sisa/screens/favorite.dart';
import 'package:sisa/screens/home_screen.dart';
import 'package:sisa/screens/login_screen.dart';
import 'package:sisa/screens/nearest_screen.dart';
import 'package:sisa/screens/profile/profile.dart';
import 'package:sisa/screens/restaurants.dart';
import 'package:sisa/screens/signup_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/Login',
      routes: {
        '/Homescreen': (context) => const Homescreen(),
        '/Login': (context) => const Loginscreen(),
        '/Signup': (context) => const Signupscreen(),
        '/list': (context) => const RestaurantScreen(),
        '/cheapest': (context) => const CheapestRestaurant(),
        '/nearest': (context) => const NearestScreen(),
        '/profile': (BuildContext) => const Profile(),
        '/favorite': (BuildContext) => const Favorite(),
      },
    );
  }
}
