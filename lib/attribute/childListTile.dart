import 'package:ListDepthLevel/model/List.dart';
import 'package:ListDepthLevel/page/child.dart';
import 'package:ListDepthLevel/provider/ListProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ChildListTile extends StatelessWidget{
  final ListModel detail;
  ChildListTile({@required this.detail});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap:() {
          Provider.of<ListProvider>(context, listen: false).selectChildList(detail);
          Navigator.pushNamed(context, "/child/${detail.listID}");
        },
        child: Card(
          child: Column(
            children: [
              Text("${detail.name}"),
              Text("${detail.prices}"),
              Text("${detail.year} / ${detail.month}")
            ],
          ),
        ),
      ),
    );
  }
}