import 'package:ListDepthLevel/attribute/dropdownbuttonlist.dart';
import 'package:ListDepthLevel/model/List.dart';
import 'package:ListDepthLevel/page/sidemenu.dart';
import 'package:ListDepthLevel/provider/ListProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CreateChild extends StatefulWidget {
  @override
  _CreateChildState createState() => _CreateChildState();
}

class _CreateChildState extends State<CreateChild> {
  List<ListModel> parentList = [];
  List<String> childrenList = [];

  ListModel listModel = ListModel(listID: null, name: null, prices: null, children: null);
  final _childFormKey = GlobalKey<FormState>();

  @override
  void initState(){
    parentList = Provider.of<ListProvider>(context, listen: false).listModelList;
    childrenList = parentList.map((children) => children.name).toList();
    super.initState();
  }

  Widget _buildCreateChildAppBar(){
    return AppBar(
      title: Text("Create Children"),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(
            Icons.check,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pushNamed(context, "/"),
        )
      ],
    );
  }

  Widget _buildCreateChildBody(){
    return Container(
      padding: EdgeInsets.all(50.0),
      child: Form(
        key: _childFormKey,
        child: Column(
          children: [
            _buildParentsList(),
            _buildCreateChildName(),
            _buildCreateChildPrices(),  
          ]
        ),
      ),
    );
  }


  Widget _buildParentsList(){
    return DropDownButtonList(
      value: listModel.name,
      onChanged: (String value){
        setState(() {
          listModel.name = value;
        });
      },
      items: childrenList
    );
  }

  Widget _buildCreateChildName(){
    return Card(
      child: Column(
        children: [
          Text("Name"),
          TextFormField(
          validator: (String value){
              if(value.isEmpty) return "Please input your child-list name";
              return null;
            },
            onSaved: (String value) => listModel.name = value
          )
        ]
      ),
    );
  }

  Widget _buildCreateChildPrices(){
    return Card(
      child: Column(
        children: [
          Text("Prices"),
          TextFormField(
            validator: (value){
              if(value.isEmpty) return "Please Input the cost you want";
              return null;
            },
            onSaved: (value) => listModel.prices = int.parse(value)
          )
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildCreateChildAppBar(),
      body: _buildCreateChildBody(),
      drawer: SideMenu(),
    );
  }
}