import 'package:ListDepthLevel/attribute/dropdown_date_format.dart';
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
  ListModel selectedList;
  ListModel listModel = ListModel(listID: null, name: null, prices: null, children: null);
  final Map<String, dynamic> listModelformData = {
    'listID': '',
    'name': '',
    'prices': 0,
    'year': '',
    'month': '',
    'children': [],
    'childrenString': null
  };
  final _childFormKey = GlobalKey<FormState>();

  @override
  void initState(){
    parentList = Provider.of<ListProvider>(context, listen: false).listModelList;
    childrenList = parentList.map((children) => children.name).toList();
    selectedList = parentList.singleWhere((parentList) => parentList.name == listModelformData['name'], orElse: () => null);
    print(selectedList);

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
          onPressed: () => submitForm(context),
        )
      ],
    );
  }

  Widget _buildCreateChildBody(){
    return Container(
      padding: EdgeInsets.all(50.0),
      child: SingleChildScrollView(
        child: Form(
          key: _childFormKey,
          child: Column(
            children: [
              // _buildParentsList(),
              _buildCreateChildName(),
              _buildCreateChildPrices(),  
              _buildYearMonthList(),
            ]
          ),
        ),
      ),
    );
  }


  Widget _buildParentsList(){
    return DropDownButtonList(
      // value: listModel.name,
      value: listModelformData['name'],
      onChanged: (String value){
        setState(() {
          // listModel.name = value;
          listModelformData['name'] = value;
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
            // onSaved: (String value) => listModel.name = value
            onSaved: (String value) => listModelformData['name'] = value
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
            // onSaved: (value) => listModel.prices = int.parse(value)
            onSaved: (value) => listModelformData['prices'] = value
          )
        ]
      )
    );
  }

  Widget _buildYearMonthList(){
    return DropDownDateFormat(
      dateFormKey: _childFormKey,
      // listModelData: listModel,
      listModelDataForm: listModelformData,
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

  void submitForm(BuildContext context){
    if(!_childFormKey.currentState.validate()) return;
    _childFormKey.currentState.save();

    print("Before Convert");
    // final ListModel selectedList = parentList.singleWhere((parentList) => parentList.name == listModel.children.toString());
    // listModel.children = selectedList.listID;
    // final ListModel selectedList = parentList.singleWhere((parentList) => parentList.name == listModelformData['name'], orElse: () => null);
    // listModelformData['name'] = (selectedList.listID != null) ? listModelformData['listID'] = 'No Dab' : selectedList.listID;
    // listModelformData['name'] = selectedList.listID;
    print(selectedList.listID);
    if(selectedList.listID == null){
      selectedList.listID = listModelformData['name'];
    }
    // listModelformData['name'] = (listModelformData['name'] != null) ? listModelformData['name'].cast<String>() : null;

    print("After Convert");    

    // Provider.of<ListProvider>(context).createListNonMap(listModel);
    Provider.of<ListProvider>(context).createListChildMap(listModelformData);
    Navigator.pushNamed(context, "/child/${listModel.listID}");
  }
}