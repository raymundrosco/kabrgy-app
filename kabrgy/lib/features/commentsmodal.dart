// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kabrgy/features/commentwidget.dart';
import 'package:kabrgy/features/submissionwidgetv2.dart';
import 'package:kabrgy/themes/themes.dart';

class CommentsModal extends StatefulWidget {
  @override
  State<CommentsModal> createState() => CommentsModalState();
}

class CommentsModalState extends State<CommentsModal> {
  bool submitted = false;
  bool reviewed = false;
  bool resubmit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppTheme().appTheme.colorScheme.background,
        child: Padding(
          padding: EdgeInsets.fromLTRB(28, 0, 28, 0),
          child: Column(
            children: [
            IconButton(
                onPressed: () => {
                      Navigator.pop(context),
                    },
                icon: Icon(Icons.keyboard_arrow_down, size: 48)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Your Submission"), Text("Pending")],
            ),
            SizedBox(height: 8,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 48,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: AppTheme().appTheme.colorScheme.primary)),
              child: Align(
                child: Text('Hello'),
                alignment: Alignment.centerLeft,
              ),
            ),
            const SizedBox(height: 8),
            Divider(),
            Expanded(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, index) {
                      return CommentWidget();
                    })),
            Divider(),
            TextFormField(
              style: const TextStyle(
                fontSize: 14,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100)),
                labelText: 'Comments',
              ),
            )
          ]),
        ),
      ),
      bottomNavigationBar: SubmissionWidgetV2(),
    );
  }

  refresh() {
    setState(() {});
  }
}
