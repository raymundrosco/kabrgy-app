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
            Text("Name", style: AppTheme().appTheme.textTheme.labelMedium,)
          ]),
        const SizedBox(height: 4,),
        Text("orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", style: AppTheme().appTheme.textTheme.bodyMedium,),
        const SizedBox(height: 8,),
        ],
      ),
    );}

  refresh() {
    setState(() {});
  }
}
