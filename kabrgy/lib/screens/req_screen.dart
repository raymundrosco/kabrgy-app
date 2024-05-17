// ignore_for_file: prefer_const_constructors

/* Authored by: Ashley Jan Cantor
Company: kabrgy
Project: kabrgy
Feature: [KBY-005] SK NAU Screen
Description: Screen providing the full content of the announcement card in the Home Screen.
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kabrgy/features/criteriacardwidget.dart';
import 'package:kabrgy/features/submissionwidget.dart';
import 'package:kabrgy/themes/themes.dart';

class Req extends StatefulWidget {
  const Req({super.key});

  @override
  State<Req> createState() => ReqState();
}

class ReqState extends State<Req> {
  bool open = false;

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
          icon: Icon(Icons.arrow_back),
          color: AppTheme().appTheme.colorScheme.secondary,
        ),
      ),
      body: Container(
        color: AppTheme().appTheme.colorScheme.surface,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 28, 28, 0),
            child: StreamBuilder(
                stream: firestore.collection('requirements').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  List<QueryDocumentSnapshot> reqData = snapshot.data!.docs;
                  QueryDocumentSnapshot data = reqData[argument];
                  print(data);
                  DateTime dueDate = (data['dueDate']).toDate();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data['title'],
                          style: AppTheme().appTheme.textTheme.headlineLarge),
                      const SizedBox(height: 8),
                      Text(dueDate.toString(),
                          style: AppTheme().appTheme.textTheme.bodyMedium),
                      const SizedBox(height: 8),
                      Text(data['description'],
                          style: AppTheme().appTheme.textTheme.bodyMedium),
                      const SizedBox(height: 8),
                      Divider(),
                      Text(
                        'CRITERIA:',
                        style: AppTheme().appTheme.textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: ListView.builder(
                          itemCount: data['criteria'].length,
                          itemBuilder: (context, index) {
                            print(data['criteria'][index].title);
                            return Criteriacardwidget(
                              title: data['criteria'][index].title,
                              percent: data['criteria'][index].percent,
                              content: data['criteria'][index].content,
                            );
                          }
                        )
                      )
                    ],
                  );
                }),
          ),
        ),
      ),
      bottomNavigationBar: SubmissionWidget(
        open: true,
      ),
    );
  }
}
