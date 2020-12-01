import 'package:ListDepthLevel/model/List.dart';
import 'package:ListDepthLevel/provider/ListProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ParentsListTile extends StatelessWidget{
  final ListModel parentsList;
  ParentsListTile({@required this.parentsList});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Provider.of<ListProvider>(context, listen: false).selectList(parentsList);
        Navigator.pushNamed(context, "/parent/${parentsList.listID}");
      },
      child: Card(
        child: Text("${parentsList.name}"),
      ),
    );
  } 
}