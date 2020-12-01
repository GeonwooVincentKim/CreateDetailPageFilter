import 'package:ListDepthLevel/page/sidemenu.dart';
import 'package:flutter/material.dart';


class DropDownButton extends StatelessWidget {
  final String hint;
  final String value;
  final Function onChanged;
  final List<dynamic> items;

  DropDownButton({
    this.hint,
    @required this.value,
    @required this.onChanged,
    @required this.items
  });
  
  @override
  Widget build(BuildContext context) {
    return DropDownButton(
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