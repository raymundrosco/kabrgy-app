// ignore_for_file: prefer_const_constructors

/* Authored by: Ashley Jan Cantor
Company: kabrgy
Project: kabrgy
Feature: [KBY-005] SK NAU Screen
Description: Screen providing the full content of the announcement card in the Home Screen.
 */

import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kabrgy/features/commentsmodal.dart';
import 'package:kabrgy/features/criteriacardwidget.dart';
import 'package:kabrgy/services/services.dart';
import 'package:kabrgy/themes/themes.dart';

class Req extends StatefulWidget {
  const Req({super.key});

  @override
  State<Req> createState() => ReqState();
}

class ReqState extends State<Req> {
  PlatformFile? pickedFile;
  String status = "Pending";
  String btnText = "Upload ";
  String filePath = "";
  bool fileUploaded = false;
  late String docId;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();

    setState(() {
      pickedFile = result?.files.first;
      status = "To submit";
      btnText = "Submit";
    });
  }

  Future uploadFile() async {
    final path = 'files/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    setState(() {
      // Services().setStatus(FirebaseFirestore.instance.doc(documentPath));
      status = "Submitted";
      btnText = "Unsubmit";
      fileUploaded = true;
      filePath = path;
    });

    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
    Services().setStatus(docId, status);
  }

  unsubmit() async {
    if (status == "Submitted") {
      btnText = "Submit";
    } else {
      btnText = "Upload File";
    }
    if (fileUploaded) {
      final ref = FirebaseStorage.instance.ref().child(filePath);
      await ref.delete(); 
      setState(() {
        fileUploaded = false;
      });
    } else {
      setState(() {
        fileUploaded = false;
      });
    }

    setState(() {
      pickedFile = null;
        status = "Pending";
    });
    
    Services().setStatus(docId, status);
  }

  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;
    final argument = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
        backgroundColor: Colors.white,
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
                    DateTime dueDate = (data['dueDate']).toDate();
                    DocumentSnapshot document = reqData[argument];
                    docId = document.id;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['title'],
                            style: AppTheme().appTheme.textTheme.headlineLarge),
                        const SizedBox(height: 8),
                        Text("Due on ${DateFormat.yMMMd().format(dueDate)}",
                            style: AppTheme().appTheme.textTheme.bodyMedium),
                        const SizedBox(height: 8),
                        Text(data['description'],
                            style: AppTheme().appTheme.textTheme.bodyMedium),
                        const SizedBox(height: 8),
                        Divider(
                        ),
                        Text(
                          'CRITERIA:',
                          style: AppTheme().appTheme.textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                            child: ListView.builder(
                                itemCount: data['criteria'].length,
                                itemBuilder: (context, index) {
                                  return Criteriacardwidget(
                                    title: data['criteria'][index]['title'],
                                    percent: data['criteria'][index]['percent'],
                                    content: data['criteria'][index]['content'],
                                  );
                                }))
                      ],
                    );
                  }),
            ),
          ),
        ),
        bottomNavigationBar: Wrap(
          children: [
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 28),
              color: AppTheme().appTheme.colorScheme.surface,
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                    child: Visibility(
                      child: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CommentsModal(
                                pickedFile: pickedFile,
                              );
                            });
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_up,
                          size: 48,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Your Submission"), Text(status)],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 48,
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: AppTheme().appTheme.colorScheme.primary,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(pickedFile != null ? pickedFile!.name : 'No file selected'),
                        Visibility(
                          visible: pickedFile != null ? true : false,
                          child: IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () { 
                              unsubmit();
                           },
                          ),
                        )
                      ]
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  FilledButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(AppTheme().appTheme.colorScheme.primary)
                    ),
                      onPressed: () {
                        if (status == "Pending") {
                          selectFile();
                        } else if (status == "To submit") {
                          uploadFile();
                        } else if (status == "Submitted") {
                          setState(() {
                            Services().setStatus(docId, status);
                            status = "To submit";
                            btnText = "Submit";
                          });
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: status == "Pending" ? true : false,
                            child: Icon(
                              Icons.file_copy,
                              size: 16,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(btnText)
                        ],
                      )),
                  SizedBox(
                    height: 16,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
