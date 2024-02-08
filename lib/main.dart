import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:push_notification_with_firebase_for_android_ios_web/UI/homePage.dart';

Future<void> _firebaseMessagingBackgroundHandler(message) async {
  await Firebase.initializeApp();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyCYfhO7puBuRoQ6QkS0v-_zff7xZGsujYM",
        authDomain: "push-notification-for-all.firebaseapp.com",
        projectId: "push-notification-for-all",
        storageBucket: "push-notification-for-all.appspot.com",
        messagingSenderId: "889737209675",
        appId: "1:889737209675:web:f9a4b1675688dd6fac2ace",
        measurementId: "G-VX21NHPXR7"),
  );
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      announcement: false,
      carPlay: false,
      criticalAlert: false,
      provisional: false);
  final token = await messaging.getToken(
      vapidKey:
          'BC-3kt57SiT5cdRqroQEjT5HVhdfh-0WYPrVDRFy6OxU3LZXccSXVhFE8DFXDXWk-5EUdezLCVm0oULmhpGB4p8');
  print(token);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
