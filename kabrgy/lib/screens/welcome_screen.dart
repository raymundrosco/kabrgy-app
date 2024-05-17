/* Authored by: Raymund Joseph M. Rosco
Company: kabrgy
Project: kabrgy
Feature: [KBY-001] Splash Screen
Description: The first screen flashed when the app opens and while it is loading.
 */

import 'package:flutter/material.dart';
import 'package:kabrgy/themes/themes.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
      return Material(
        color: AppTheme().appTheme.colorScheme.surface,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Center (
                    child: Text("Welcome Kabarangay!",
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: AppTheme().appTheme.colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/login');
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(AppTheme().appTheme.colorScheme.primary),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0)),
                    ),
                  ),
                  child:
                    Text("Login",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppTheme().appTheme.colorScheme.onPrimary
                      ),
                    )
                  ),
                ),
                const SizedBox(height: 8,),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/register');
                  },
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        side: BorderSide(color: AppTheme().appTheme.colorScheme.onSurface),
                        borderRadius: BorderRadius.circular(100.0)),
                    ),
                  ),
                  child:
                    Text("Register",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppTheme().appTheme.colorScheme.primary
                      ),
                    )
                  ),
                ),
              ],
            ),
          ),
      );
  }
}