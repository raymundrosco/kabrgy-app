import 'package:flutter/material.dart';
import 'package:kabrgy/themes/themes.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppTheme().appTheme.appBarTheme.backgroundColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu), 
            onPressed: () { 
              Scaffold.of(context).openDrawer();
            },
            color: Colors.white,
            iconSize: 36,),
          IconButton(
            icon: const Icon(Icons.account_circle), 
            onPressed: () {  },
            color: Colors.white,
            iconSize: 36,),
        ]
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}