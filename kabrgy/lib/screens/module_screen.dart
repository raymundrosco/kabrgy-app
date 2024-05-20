/* Authored by: Ashley Jan Cantor
Company: kabrgy
Project: kabrgy
Feature: [KBY-005] SK NAU Screen
Description: Screen providing the full content of the announcement card in the Home Screen.
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kabrgy/themes/themes.dart';

class Module extends StatelessWidget {
  const Module({super.key});

  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;
    final argument = ModalRoute.of(context)!.settings.arguments as int;
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
        child: StreamBuilder(
            stream: firestore.collection('modules').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              List<QueryDocumentSnapshot> modData = snapshot.data!.docs;
              QueryDocumentSnapshot data = modData[argument];
              return Padding(
                padding: const EdgeInsets.fromLTRB(28, 28, 28, 0),
                child: ListView(
                  children: <Widget>[
                    Text(data['title'],
                        style: AppTheme().appTheme.textTheme.headlineLarge),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'PREREQUISITES:',
                      style: AppTheme().appTheme.textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Flexible(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: data['preReq'].length,
                          itemBuilder: (context, index) {
                            return Text(
                                '${index + 1}. ${data['preReq'][index]}');
                          }),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'GUIDE:',
                      style: AppTheme().appTheme.textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(data['content'],
                        style: AppTheme().appTheme.textTheme.bodyMedium),
                    const SizedBox(height: 28),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
