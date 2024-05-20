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
import 'package:intl/intl.dart';

List<String> statusList = <String>['Todo', 'Done'];

class ReqList extends StatefulWidget {
  const ReqList({super.key});

  @override
  State<ReqList> createState() => ReqListState();
}

class ReqListState extends State<ReqList> {
  String statusController = "Todo";

  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(28, 28, 28, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Work well!',
                  style: AppTheme().appTheme.textTheme.displaySmall,
                ),
                Text('You can do it! Para sa kabataan!',
                    style: AppTheme().appTheme.textTheme.headlineMedium),
                Divider(),
                Column(
                  children: [
                    DropdownMenu<String>(
                      menuStyle: MenuStyle(
                        backgroundColor: WidgetStatePropertyAll(AppTheme().appTheme.colorScheme.primary),
                      ),
                      expandedInsets: EdgeInsets.zero,
                      initialSelection: statusController,
                      inputDecorationTheme: InputDecorationTheme(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                        fillColor: Colors.black,
                        constraints:
                            BoxConstraints.tight(const Size.fromHeight(52)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 16,
                      ),
                      onSelected: (String? value) {
                        statusController = value!;
                        setState(() {
                          
                        });
                      },
                      dropdownMenuEntries:
                          statusList.map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry<String>(
                          value: value,
                          label: value,
                          style: ButtonStyle(
                            foregroundColor: WidgetStatePropertyAll(Colors.white)
                          )
                        );
                      }).toList(),
                    ),
                  ],
                ),
                SizedBox(height: 8,),
                StreamBuilder(
                    stream: firestore.collection('requirements').snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      List<QueryDocumentSnapshot> reqData = snapshot.data!.docs;
                      if (snapshot.hasData) {
                        if (snapshot.data!.docs.isNotEmpty) {
                          return Wrap(
                            children: [
                              ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: reqData.length,
                                itemBuilder: (context, index) {
                                  DateTime dueDate = (reqData[index]['dueDate']).toDate();
                                  if (reqData[index]['status'] == statusController) {
                                    return Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            '/req',
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
                                              Text(reqData[index]['title'],
                                                  style: AppTheme()
                                                      .appTheme
                                                      .textTheme
                                                      .headlineMedium),
                                              Text('Due on ${DateFormat.yMMMd().format(dueDate)}',
                                                style: AppTheme()
                                                    .appTheme
                                                    .textTheme
                                                    .bodyMedium,
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
                                  } else {
                                    return SizedBox(height: 0,);
                                  }
                                },
                              ),
                            ],
                          );
                        }
                      }
                      return CircularProgressIndicator();
                    }),
              ],
            ),
          ),
        ],
      ),
      drawer: const NavDrawerWidget(),
    );
  }
}