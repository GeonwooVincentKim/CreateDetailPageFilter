import 'package:ListDepthLevel/attribute/functions.dart';
import 'package:ListDepthLevel/data/DummyData.dart';
import 'package:ListDepthLevel/model/List.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ListProvider with ChangeNotifier{
  ListModel menulist; // Main
  ListModel detailList; // Sub
  List<ListModel> _listModelList = [list1, list2, list3, list4].toList();
  List<ListModel> _listModelEmptyList = [];

  List<ListModel> get listModelList => [..._listModelList];
  List<ListModel> get emptyList => [..._listModelEmptyList];
  
  ListModel get selectedDetailList => detailList != null ? ListModel.fromNonMap(selectedDetailList) : null;
  ListModel get selectedList => menulist;

  void selectList(ListModel list){
    menulist = list;
    notifyListeners();
  }

  void selectChildList(ListModel list){
    detailList = list;
    notifyListeners();
  }

  void createListNonMap(ListModel list){
    list.listID = getGenerateString(2);
    final ListModel createList = ListModel.fromNonMap(list);
    _listModelList.add(createList);
    notifyListeners();
  }
}