import 'package:ListDepthLevel/model/List.dart';
import 'package:ListDepthLevel/attribute/ParentsListTile.dart';
import 'package:ListDepthLevel/page/sidemenu.dart';
import 'package:ListDepthLevel/provider/ListProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Parents extends StatefulWidget {
  @override
  _ParentsState createState() => _ParentsState();
}

class _ParentsState extends State<Parents> {
  List<ListModel> mainPage = [];
  Widget _buildParentsAppBar(){
    return AppBar(
      title: Text("Parents"),
      centerTitle: true,
      actions: [
        
      ],
    );
  }

  Widget _buildParentsBody(){
    return Container(
      padding: EdgeInsets.all(10),
      child: Consumer<ListProvider>(
        builder: (ctx, mainList, child){
          final List<ListModel> listMainmenu = mainList.listModelList;
          mainPage = listMainmenu.toList();

          return GridView.builder(
            shrinkWrap: true,
            itemCount: mainPage.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              crossAxisSpacing: 30.0,
              mainAxisSpacing: 30.0
            ),
            physics: ScrollPhysics(),
            itemBuilder: (context, index) => ParentsListTile(parentsList: mainPage[index]),
          );
        }
      )
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildParentsAppBar(),
      body: _buildParentsBody(),
      drawer: SideMenu(),
    );
  }
}