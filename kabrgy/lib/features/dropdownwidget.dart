

import 'package:flutter/material.dart';

class DropDownMenuWidget extends StatefulWidget {
  final List<String> list;
  final String hint;
  const DropDownMenuWidget({ Key? key, required this.list, required this.hint }): super(key: key);

  @override
  State<DropDownMenuWidget> createState() => _DropDownMenuWdigetState();
}

class _DropDownMenuWdigetState extends State<DropDownMenuWidget> {

  String dropdownValue = "";

  @override
  Widget build(BuildContext context) {
    return 
    Expanded(
      child: DropdownMenu<String>(
        expandedInsets: EdgeInsets.zero,
        hintText: widget.hint,
          inputDecorationTheme: InputDecorationTheme(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              constraints: BoxConstraints.tight(const 
               Size.fromHeight(52)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          textStyle: const TextStyle(fontSize: 16),
          onSelected: (String? value) {
            dropdownValue = value!;
          }, 
          dropdownMenuEntries: widget.list.map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>(
              value: value, 
              label: value,
            );
          }).toList(),
        ),
    );
  }
}
