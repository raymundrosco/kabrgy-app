import 'package:flutter/material.dart';
import 'package:kabrgy/themes/themes.dart';

class FeedbackModalWidget extends StatefulWidget {
  @override
  State<FeedbackModalWidget> createState() => FeedbackModalWidgetState();
}

class  FeedbackModalWidgetState extends State<FeedbackModalWidget> {
  bool open = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Feedback:", style: AppTheme().appTheme.textTheme.titleLarge,)
        ]),
    );
  }

  refresh() {
    setState(() {});
  }
}
