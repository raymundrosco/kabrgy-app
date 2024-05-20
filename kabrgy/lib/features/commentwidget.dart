import 'package:flutter/material.dart';
import 'package:kabrgy/themes/themes.dart';

class CommentWidget extends StatefulWidget {
  @override
  State<CommentWidget> createState() => CommentWidgetState();
}

class CommentWidgetState extends State<CommentWidget> {
  bool open = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: 
      Column(
        children: [
          Row(children: [
            Icon(Icons.account_circle, size: 36,),
            const SizedBox(width: 8,),
            Text("Maria, Bombon LYDO", style: AppTheme().appTheme.textTheme.labelMedium,)
          ]),
        const SizedBox(height: 4,),
        Text("So far, god job. One comment, please create more porjects on Agriculture. Thank you!", style: AppTheme().appTheme.textTheme.bodyMedium,),
        const SizedBox(height: 8,),
        ],
      ),
    );}

  refresh() {
    setState(() {});
  }
}
