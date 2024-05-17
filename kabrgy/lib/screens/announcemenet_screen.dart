/* Authored by: Ashley Jan Cantor
Company: kabrgy
Project: kabrgy
Feature: [KBY-005] SK NAU Screen
Description: Screen providing the full content of the announcement card in the Home Screen.
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kabrgy/themes/themes.dart';

class Announcements extends StatelessWidget {
  const Announcements({super.key});

  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;
    final argument = ModalRoute.of(context)!.settings.arguments as int;
    print(argument);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppTheme().appTheme.appBarTheme.backgroundColor,
        title: IconButton(
          onPressed: () => {
            Navigator.pop(context, true)
          },
          icon: const Icon(Icons.arrow_back),
          color: AppTheme().appTheme.colorScheme.secondary,
        ),
      ),
      body: 
      Container(
        color: AppTheme().appTheme.colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(28, 28, 28, 0),
          child: 
          StreamBuilder(
            stream: firestore.collection('news').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              List<QueryDocumentSnapshot> newsData = snapshot.data!.docs;
              QueryDocumentSnapshot data = newsData[argument];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data['title'],
                      style: AppTheme().appTheme.textTheme.headlineLarge),
                  const SizedBox(height: 8),
                  Text('By ${data['author']}',
                      style: AppTheme().appTheme.textTheme.bodyMedium),
                  const SizedBox(height: 8),
                  Text(data['content'],
                      style: AppTheme().appTheme.textTheme.bodyMedium),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
