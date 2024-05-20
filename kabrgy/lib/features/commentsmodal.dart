// ignore_for_file: prefer_const_constructors

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:kabrgy/features/commentwidget.dart';
import 'package:kabrgy/themes/themes.dart';

class CommentsModal extends StatefulWidget {
  const CommentsModal(
      {super.key, required this.pickedFile});
  final PlatformFile? pickedFile;

  @override
  State<CommentsModal> createState() => CommentsModalState();
}

class CommentsModalState extends State<CommentsModal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppTheme().appTheme.colorScheme.surface,
        child: Padding(
          padding: EdgeInsets.fromLTRB(28, 0, 28, 0),
          child: Column(children: [
            IconButton(
                onPressed: () => {
                      Navigator.pop(context),
                    },
                icon: Icon(Icons.keyboard_arrow_down, size: 48)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Your Submission"), Text("Pending")],
            ),
            SizedBox(
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
                        Text(widget.pickedFile != null ? widget.pickedFile!.name : 'No file selected'),
                      ]
                    ),
                  ),
            Divider(),
            Expanded(
                child: ListView.builder(
                    itemCount: 1,
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
            ),
            SizedBox(height: 16,)
          ]),
        ),
      ),
    );
  }
}
