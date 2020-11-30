import 'package:flutter/material.dart';


class ListModel{
  String listID;
  String name;
  int prices;
  List<ListModel> children;

  ListModel({
    @required this.listID,
    this.name,
    this.prices,
    this.children
  });

  factory ListModel.fromNonMap(ListModel list){
    return ListModel(
      listID: list.listID ?? '',
      name: list.name ?? '',
      prices: list.prices ?? '',
      children: list.children ?? [],
    );
  }
}