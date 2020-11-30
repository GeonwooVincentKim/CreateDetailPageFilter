import 'package:ListDepthLevel/model/List.dart';


var subMenu1 = [
  ListModel(
    listID: 'list11',
    name: 'list11',
    prices: 1000,
  ),

  ListModel(
    listID: 'list12',
    name: 'list12',
    prices: 2000,
  ),

  ListModel(
    listID: 'list13',
    name: 'list13',
    prices: 3000,
  ),
  
  ListModel(
    listID: 'list14',
    name: 'list14',
    prices: 4000
  )
].toList();

var subMenu2 = [
  ListModel(
    listID: 'list21',
    name: 'list21',
    prices: 1000,
  ),

  ListModel(
    listID: 'list22',
    name: 'list22',
    prices: 2000,
  ),

  ListModel(
    listID: 'list23',
    name: 'list23',
    prices: 3000,
  ),
  
  ListModel(
    listID: 'list24',
    name: 'list24',
    prices: 4000
  )
].toList();

var subMenu3 = [
  ListModel(
    listID: 'list31',
    name: 'list31',
    prices: 1000,
  ),

  ListModel(
    listID: 'list32',
    name: 'list32',
    prices: 2000,
  ),

  ListModel(
    listID: 'list33',
    name: 'list33',
    prices: 3000,
  ),
  
  ListModel(
    listID: 'list34',
    name: 'list34',
    prices: 4000
  )
].toList();

var subMenu4 = [
  ListModel(
    listID: 'list41',
    name: 'list41',
    prices: 1000,
  ),

  ListModel(
    listID: 'list42',
    name: 'list42',
    prices: 2000,
  ),

  ListModel(
    listID: 'list43',
    name: 'list43',
    prices: 3000,
  ),
  
  ListModel(
    listID: 'list44',
    name: 'list44',
    prices: 4000
  )
].toList();

ListModel list1 = ListModel(listID: 'list1', name: 'list1', children: subMenu1);
ListModel list2 = ListModel(listID: 'list2', name: 'list2', children: subMenu2);
ListModel list3 = ListModel(listID: 'list3', name: 'list3', children: subMenu3);
ListModel list4 = ListModel(listID: 'list4', name: 'list4', children: subMenu4);
