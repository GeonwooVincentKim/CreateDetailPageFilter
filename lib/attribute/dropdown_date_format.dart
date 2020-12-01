import 'package:ListDepthLevel/attribute/dropdownbuttonlist.dart';
import 'package:ListDepthLevel/model/List.dart';
import 'package:flutter/material.dart';


class DropDownDateFormat extends StatefulWidget {
  GlobalKey<FormState> dateFormKey;
  ListModel listModelData;

  DropDownDateFormat({
    @required this.dateFormKey,
    @required this.listModelData
  });
  
  @override
  _DropDownDateFormatState createState() => _DropDownDateFormatState();
}

class _DropDownDateFormatState extends State<DropDownDateFormat> {
  final List<String> yearList = [];
  final List<String> monthList = [];

  @override
  void initState(){
    final DateTime today = DateTime.now();
    for(int i = 2000; i <= today.year; i++){
      yearList.add(i.toString());
    }
    // ignore: unrelated_type_equality_checks
    if(widget.listModelData.year == '')
      widget.listModelData.year = yearList[yearList.length - 1];
    for(int i = 1; i <= today.month; i++){
      monthList.add(i.toString());
    }
    if(widget.listModelData.month == '')
      widget.listModelData.month = monthList[monthList.length - 1];
    super.initState();
  }

  Widget _buildYearDropDown(){
    return DropDownButtonList(
      value: widget.listModelData.year,
      onChanged: (String value){
        setState(() {
          widget.listModelData.year = value;
        });
      },
      items: yearList
    );
  }

  Widget _buildMonthDropDown(){
    return DropDownButtonList(
      value: widget.listModelData.month,
      onChanged: (String value){
        setState(() {
          widget.listModelData.month = value;
        });
      },
      items: monthList
    ); 
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      child: Row(
        children: [
          _buildYearDropDown(),
          _buildMonthDropDown(),
        ],
      )
    );
  }
}