/* Authored by: Ashley Jan Cantor & Raymund Joseph M. Rosco
Company: kabrgy
Project: kabrgy
Feature: [KBY-006] SK Navigation Drawer
Description: Used to log-in to the user account or navigate to the registration page.
 */

import 'package:flutter/material.dart';
import 'package:kabrgy/services/services.dart';
import 'package:kabrgy/themes/themes.dart';

const List<String> buttonList = <String>[
  'Home',
  'Study Modules',
  'Pass Requirements',
  'Social Hub'
];

int selectedKey = 0;

class NavDrawerWidget extends StatefulWidget {
  const NavDrawerWidget({super.key});

  @override
  State<NavDrawerWidget> createState() => _NavDrawerWidgetState();
}

class _NavDrawerWidgetState extends State<NavDrawerWidget> {
  @override
  void initState() {
    // AuthenticationService.signOut();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: AppTheme().appTheme.colorScheme.background,
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: buttonList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 56,
                              width: double.infinity,
                              child: TextButton(
                                  onPressed: () => {
                                    selectedKey = index,
                                    refresh(),
                                    Scaffold.of(context).closeDrawer(),
                                    selectPage(index)
                                  },
                                  style: selectButtonStyle(index),
                                  child: Row(
                                    children: [
                                      selectIcon(index),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        buttonList[index],
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: selectTextColor(index),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            const SizedBox(
                              height: 16,
                            )
                          ],
                        );
                      }),
                ),
                SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () => {
                            Services().signOUt(context: context)
                          },
                      style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                              AppTheme().appTheme.colorScheme.onSecondary),
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          alignment: Alignment.centerLeft),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.door_back_door,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Sign-out",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ));
  }

  selectPage(int key) {
    if (key == 0) {
      Navigator.of(context).pushNamed('/home');
    } else if (key == 1) {
      Navigator.of(context).pushNamed('/module_list');
    } else if (key == 2) {
      Navigator.of(context).pushNamed('/req_list');
    } else if (key == 3) {
      Navigator.of(context).pushNamed('/socials');
    }
  }

  selectButtonStyle(int key) {
    if (selectedKey == key) {
      return ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
              AppTheme().appTheme.colorScheme.primary),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          alignment: Alignment.centerLeft);
    } else {
      return ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
              AppTheme().appTheme.colorScheme.background),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side:
                  BorderSide(color: AppTheme().appTheme.colorScheme.onSurface),
            ),
          ),
          alignment: Alignment.centerLeft);
    }
  }

  selectTextColor(int key) {
    if (selectedKey == key) {
      return AppTheme().appTheme.colorScheme.onPrimary;
    } else {
      return AppTheme().appTheme.colorScheme.onBackground;
    }
  }

  selectIcon(int key) {
    if (selectedKey != key) {
      if (key == 0) {
        return Icon(Icons.home, color: AppTheme().appTheme.colorScheme.primary);
      } else if (key == 1) {
        return Icon(Icons.book, color: AppTheme().appTheme.colorScheme.primary);
      } else if (key == 2) {
        return Icon(Icons.upload,
            color: AppTheme().appTheme.colorScheme.primary);
      } else if (key == 3) {
        return Icon(Icons.people,
            color: AppTheme().appTheme.colorScheme.primary);
      }
    } else {
      if (key == 0) {
        return Icon(Icons.home,
            color: AppTheme().appTheme.colorScheme.secondary);
      } else if (key == 1) {
        return Icon(Icons.book,
            color: AppTheme().appTheme.colorScheme.secondary);
      } else if (key == 2) {
        return Icon(Icons.upload,
            color: AppTheme().appTheme.colorScheme.secondary);
      } else if (key == 3) {
        return Icon(Icons.people,
            color: AppTheme().appTheme.colorScheme.secondary);
      }
    }
  }

  refresh() {
    setState(() {});
  }
}
