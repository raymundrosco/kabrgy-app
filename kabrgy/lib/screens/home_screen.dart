/* Authored by: Ashley Jan Cantor and Raymund Joseph M. Rosco
Company: kabrgy
Project: kabrgy
Feature: [KBY-004] Home Screen
Description: Used to view announcements, which can be expounded.
 */

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kabrgy/features/appbarwidget.dart';
import 'package:kabrgy/features/navdrawerwidget.dart';
import 'package:kabrgy/themes/themes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

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
              'Kamusta ka!',
              style: AppTheme().appTheme.textTheme.displaySmall,
            ),
            Text('Stay updated with the latest news!',
                style: AppTheme().appTheme.textTheme.headlineMedium),
            const Divider(),
            Expanded(
              child: StreamBuilder(
                stream: firestore.collection('news').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  List<QueryDocumentSnapshot> newsData = snapshot.data!.docs;
                  if (snapshot.hasData) {
                    if (snapshot.data!.docs.isNotEmpty) {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: newsData.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/announcement',
                                    arguments: index,
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
                                      Text(newsData[index]['title'],
                                          style: AppTheme()
                                              .appTheme
                                              .textTheme
                                              .headlineMedium),
                                      SizedBox(height: 4,),
                                      Text('By ${newsData[index]['author']}',
                                        style: AppTheme()
                                            .appTheme
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      SizedBox(height: 4,),
                                      Text(newsData[index]['content'],
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
                    } else {
                      return const CircularProgressIndicator();
                    }
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
          ],
        ),
      ),
      drawer: const NavDrawerWidget(),
    );
  }
}
