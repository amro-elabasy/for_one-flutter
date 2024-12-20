import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:for_one/screens/booking/booking_confirmation_screen.dart';
import 'screens/splash/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'For One',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: Colors.black,
        primaryColor: const Color(0xFFFFB800),
      ),
      home: const SplashScreen(),
      routes: {
        '/booking_confirmation': (context) => BookingConfirmationScreen(
              serviceName: '', // سيتم تحديثها لاحقاً
              servicePrice: 0,
              barberName: '',
              bookingDate: DateTime.now(),
              bookingTime: '',
              imageUrl: '',
            ),
      },
    );
  }
}
