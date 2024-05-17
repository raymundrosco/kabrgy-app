/* Authored by: Raymund Joseph M. Rosco
Company: kabrgy
Project: kabrgy
Feature: [KBY-001] Splash Screen
Description: The first screen flashed when the app opens and while it is loading.
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kabrgy/themes/themes.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});


  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushNamed('/welcome');
    });
      return Material(
        color: AppTheme().appTheme.colorScheme.primary,
        child: Center(
          child: SizedBox(
            width: 180,
            child: Image.asset('assets/img/Logov2.png'),
          )
        )
      );
  }
}