import 'package:ListDepthLevel/attribute/dropdownbuttonlist.dart';
import 'package:ListDepthLevel/model/List.dart';
import 'package:ListDepthLevel/provider/ListProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class DropDownDateFormat extends StatefulWidget {
  GlobalKey<FormState> dateFormKey;
  ListModel listModelData;
  Map<String, dynamic> listModelDataForm;

  DropDownDateFormat({
    @required this.dateFormKey,
    // @required this.listModelData,
    @required this.listModelDataForm
  });
  
  @override
  _DropDownDateFormatState createState() => _DropDownDateFormatState();
}

class _DropDownDateFormatState extends State<DropDownDateFormat> {
  final List<String> yearList = [];
  final List<String> monthList = [];
  List<ListModel> parentList = [];
  List<String> childrenList = [];

  @override
  void initState(){
    parentList = Provider.of<ListProvider>(context, listen: false).listModelList;
    childrenList = parentList.map((children) => children.name).toList();
    widget.listModelDataForm['name'] = childrenList[0];
    final DateTime today = DateTime.now();
    for(int i = 2000; i <= today.year; i++){
      yearList.add(i.toString());
    }
    // ignore: unrelated_type_equality_checks
    // if(widget.listModelData.year == '')
    //   widget.listModelData.year = yearList[yearList.length - 1];
    if(widget.listModelDataForm['year'] == '')
      widget.listModelDataForm['year'] = yearList[yearList.length - 1];
    for(int i = 1; i <= today.month; i++){
      monthList.add(i.toString());
    }
    // if(widget.listModelData.month == '')
    //   widget.listModelData.month = monthList[monthList.length - 1];
    if(widget.listModelDataForm['month'] == '')
      widget.listModelDataForm['month'] = monthList[monthList.length - 1];
    super.initState();
  }

  Widget _buildYearDropDown(){
    return DropDownButtonList(
      // value: widget.listModelData.year,
      value: widget.listModelDataForm['year'],
      onChanged: (String value){
        setState(() {
          // widget.listModelData.year = value;
          widget.listModelDataForm['year'] = value;
        });
      },
      items: yearList
    );
  }

  Widget _buildMonthDropDown(){
    return DropDownButtonList(
      // value: widget.listModelData.month,
      value: widget.listModelDataForm['month'],
      onChanged: (String value){
        setState(() {
          // widget.listModelData.month = value;
          widget.listModelDataForm['month'] = value;
        });
      },
      items: monthList
    ); 
  }

  Widget _buildParentDropDown(){
    return DropDownButtonList(
      value: widget.listModelDataForm['name'],
      onChanged: (String value){
        setState(() {
          widget.listModelDataForm['name'] = value;
        });
      },
      items: childrenList
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      child: Column(
        children: [
          Row(
            children: [
              _buildYearDropDown(),
              _buildMonthDropDown(),
            ],
          ),
          _buildParentDropDown(),
        ],
      )
    );
  }
}