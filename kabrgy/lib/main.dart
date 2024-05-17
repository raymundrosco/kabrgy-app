import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kabrgy/route_generator.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(
    const MaterialApp(
      title: "kabrgy",
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    )
  );
}