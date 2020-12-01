import 'package:flutter/material.dart';


class DropDownButtonList extends StatelessWidget {
  final Widget hint;
  final String value;
  final Function onChanged;
  final List<dynamic> items;

  DropDownButtonList({
    this.hint,
    @required this.value,
    @required this.onChanged,
    @required this.items
  });
  
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      hint: hint,
      value: value,
      onChanged: onChanged,
      items: items.map<DropdownMenuItem<String>>((value){
        return DropdownMenuItem(
          value: value,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(value, style: TextStyle(color: Colors.black38))
          )
        );
      }).toList()
    );
  }
}