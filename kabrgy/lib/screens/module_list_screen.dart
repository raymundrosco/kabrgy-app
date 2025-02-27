/* Authored by: Ashley Jan Cantor and Raymund Joseph M. Rosco
Company: kabrgy
Project: kabrgy
Feature: [KBY-004] Home Screen
Description: Used to view announcements, which can be expounded.
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kabrgy/features/appbarwidget.dart';
import 'package:kabrgy/features/navdrawerwidget.dart';
import 'package:kabrgy/themes/themes.dart';

class ModuleList extends StatefulWidget {
  const ModuleList({super.key});

  @override
  State<ModuleList> createState() => _ModuleListState();
}

class _ModuleListState extends State<ModuleList> {
  get itemBuilder => null;

  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(),
      body: Container(
        padding: const EdgeInsets.fromLTRB(28, 28, 28, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Aral well!',
              style: AppTheme().appTheme.textTheme.displaySmall,
            ),
            Text('Learn to extend your impact!',
                style: AppTheme().appTheme.textTheme.headlineMedium),
            const Divider(
            ),
            Expanded(
              child: StreamBuilder(
                  stream: firestore.collection('modules').snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    List<QueryDocumentSnapshot> modData = snapshot.data!.docs;
                    if (snapshot.hasData) {
                      if (snapshot.data!.docs.isNotEmpty) {
                        return ListView.builder(
                          itemCount: modData.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/module',
                                      arguments: index
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(16.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppTheme()
                                              .appTheme
                                              .colorScheme
                                              .onSecondary),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(modData[index]['title'],
                                            style: AppTheme()
                                                .appTheme
                                                .textTheme
                                                .headlineMedium),
                                        Text(modData[index]['content'],
                                          style: AppTheme()
                                              .appTheme
                                              .textTheme
                                              .bodyMedium,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                )
                              ],
                            );
                          },
                        );
                      }
                    }
                    return CircularProgressIndicator();
                  }),
            ),
          ],
        ),
      ),
      drawer: const NavDrawerWidget(),
    );
  }
}
