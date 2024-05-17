import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kabrgy/screens/home_screen.dart';
import 'package:kabrgy/screens/welcome_screen.dart';
// import 'package:kabrgy/screens/home_screen.dart';
// import 'package:kabrgy/screens/welcome_screen.dart';

const List<String> userList = <String>[
  'Sangguniang Kabataan Official',
  'Local Youth Development Officer',
  'Katipunan ng Kabataan Member'
];
const List<String> positionList = <String>[
  'Chairperson',
  'Secretary',
  'Treasurer',
  'Councilor'
];
const List<String> brgyList = <String>[
  'Sto. Domingo',
  'San Jose',
  'San Antonio',
  'San Isidro',
  'Pagao',
  'San Roque',
  'San Francisco',
  'Siembre'
];
const List<String> municipalityList = <String>['Bombon'];

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});
  

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        Widget widget = const Welcome();
        FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
          if (user != null) {
            widget = const Home();
            print('succes');
          }
        });
        return widget;
      }
    );
  }
}
