import 'package:ListDepthLevel/model/List.dart';
import 'package:ListDepthLevel/page/sidemenu.dart';
import 'package:ListDepthLevel/provider/ListProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Detail extends StatefulWidget {
  final String detailID;
  Detail({@required this.detailID});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  ListModel detailName;

  @override
  void initState(){
    detailName = Provider.of<ListProvider>(context, listen: false).detailList;
    
    if(detailName == null){
      final List<ListModel> detailTitle = Provider.of<ListProvider>(context, listen: false).detailList.children; 
      detailName = detailTitle.firstWhere((detail) => detail.listID == widget.detailID);
    }
  }

  Widget _buildDetailAppBar(){
    return AppBar(
      title: Text(detailName.name),
      centerTitle: true,
    );
  }

  Widget _buildDetailBody(){
    return Container(
      child: Column(
        children: [
          Text("${detailName.name}"),
          Text("${detailName.prices}")
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildDetailAppBar(),
      body: _buildDetailBody(),
      drawer: SideMenu(),
    );
  }
}