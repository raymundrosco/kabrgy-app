// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kabrgy/themes/themes.dart';

class SubmissionWidget extends StatefulWidget {
  final bool open;
  SubmissionWidget({required this.open});

  @override
  State<SubmissionWidget> createState() => SubmissionWidgetState();
}

class SubmissionWidgetState extends State<SubmissionWidget> {
  bool submitted = false;
  bool reviewed = false;
  bool resubmit = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Column(
        children: [
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 28),
            color: AppTheme().appTheme.colorScheme.background,
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  child: Visibility(
                    visible: widget.open,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/comments');
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
                  children: [Text("Your Submission"), Text("Pending")],
                ),
                const SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.file_copy,
                          size: 16,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text("Upload files")
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  refresh() {
    setState(() {});
  }
}
