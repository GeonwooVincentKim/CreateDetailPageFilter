import 'package:flutter/material.dart';


class SideMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text("DrawerHeader"),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(title: Text("Create ParentList"), onTap: (){Navigator.pushNamed(context, "/createParents");},),
          ListTile(title: Text("Create ChildList"), onTap: (){Navigator.pushNamed(context, "/createChilds");}),
        ],
      )
    );
  }
}