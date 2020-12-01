import 'package:ListDepthLevel/model/List.dart';
import 'package:ListDepthLevel/page/attribute/childListTile.dart';
import 'package:ListDepthLevel/page/sidemenu.dart';
import 'package:ListDepthLevel/provider/ListProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Child extends StatefulWidget {
  final String childID;
  Child({@required this.childID});
  @override
  _ChildState createState() => _ChildState();
}

class _ChildState extends State<Child> {
  ListModel listTypes;
  List<ListModel> child = [];

  @override
  void initState(){
    listTypes = Provider.of<ListProvider>(context, listen: false).menulist;
    if(listTypes == null){
      final List<ListModel> listTitle = Provider.of<ListProvider>(context, listen: false).listModelList;
      listTypes = listTitle.firstWhere((child) => child.listID == widget.childID);
    }
    super.initState();
  }

  Widget _buildChildAppBar(){
    return AppBar(
      title: Text(widget.childID),
      centerTitle: true,
    );
  }

  Widget _buildChildBody(){
    return Container(
      padding: EdgeInsets.all(10),
      child: Consumer<ListProvider>(
        builder: (ctx, childList, child){
          ListModel listMenu = Provider.of<ListProvider>(context, listen: false).selectedList;
          final List<ListModel> childName = listMenu.children;
          print(listMenu.children);

          print(childName.length);
          return childName.length == 0 || childName.length == null || childName.isEmpty ?
            Container():
            GridView.builder(
              shrinkWrap: true,
              itemCount: childName.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                crossAxisSpacing: 30.0,
                mainAxisSpacing: 30.0
              ),
              physics: ScrollPhysics(),
              itemBuilder: (context, index) => ChildListTile(detail: childName[index])
            );
        }
      )
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildChildAppBar(),
      body: _buildChildBody(),
      drawer: SideMenu(),
    );
  }
}