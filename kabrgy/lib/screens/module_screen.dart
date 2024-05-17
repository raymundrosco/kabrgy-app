/* Authored by: Ashley Jan Cantor
Company: kabrgy
Project: kabrgy
Feature: [KBY-005] SK NAU Screen
Description: Screen providing the full content of the announcement card in the Home Screen.
 */

import 'package:flutter/material.dart';
import 'package:kabrgy/themes/themes.dart';

class Module  extends StatelessWidget {
  const Module ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppTheme().appTheme.appBarTheme.backgroundColor,
        title: IconButton(
          onPressed: () => {Navigator.pop(context, true)},
          icon: const Icon(Icons.arrow_back),
          color: AppTheme().appTheme.colorScheme.secondary,
        ),
      ),
      body: Container(
        color: AppTheme().appTheme.colorScheme.surface,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Crafting the Comprehensive Barangay Youth Development Plan',
                      style: AppTheme().appTheme.textTheme.headlineLarge),
                  const SizedBox(height: 8),
                  const Placeholder(
                    fallbackHeight: 160,
                    fallbackWidth: double.infinity,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'PREREQUISITES:',
                    style: AppTheme().appTheme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text('Announcement details...',
                      style: AppTheme().appTheme.textTheme.bodyMedium),
                  const SizedBox(height: 8),
                  Text(
                    'GUIDE:',
                    style: AppTheme().appTheme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text('Announcement details...',
                      style: AppTheme().appTheme.textTheme.bodyMedium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
