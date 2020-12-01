import 'package:ListDepthLevel/model/List.dart';
import 'package:ListDepthLevel/page/sidemenu.dart';
import 'package:ListDepthLevel/provider/ListProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CreateParents extends StatefulWidget {
  @override
  _CreateParentsState createState() => _CreateParentsState();
}

class _CreateParentsState extends State<CreateParents> {
  final _parentFormKey = GlobalKey<FormState>();
  ListModel parentList = ListModel(listID: null, name: null, children: null);
  
  @override
  void initState(){
    super.initState();
  }

  Widget _buildCreateParentAppBar(){
    return AppBar(
      title: Text("Create Parents"),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(
            Icons.check,
            color: Colors.white,
          ), onPressed: () => submitForm(),
        )
      ],
    );
  }

  Widget _buildCreateParentBody(){
    return Container(
      padding: EdgeInsets.all(50.0),
      child: Form(
        key: _parentFormKey,
        child: Card(
          child: Column(
            children: [
              Text("Name"),
              TextFormField(
                validator: (value){
                  if(value.isEmpty) return "Please Input the name you want";
                  return null; 
                },
                onSaved: (value) => parentList.name = value
              ),
            ],
          )
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildCreateParentAppBar(),
      body: _buildCreateParentBody(),
      drawer: SideMenu(),
    );
  }

  void submitForm(){
    if(!_parentFormKey.currentState.validate()) return;
    _parentFormKey.currentState.save();
    Provider.of<ListProvider>(context).createListNonMap(parentList);
    print(parentList);
    Navigator.pushNamed(context, "/");
  }
}