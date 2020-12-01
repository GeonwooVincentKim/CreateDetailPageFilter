import 'package:flutter/material.dart';


class ListModel{
  String listID;
  String name;
  int prices;
  String year;
  String month;
  List<ListModel> children;

  ListModel({
    @required this.listID,
    this.name,
    this.prices,
    this.year,
    this.month,
    this.children
  });

  factory ListModel.fromNonMap(ListModel list){
    return ListModel(
      listID: list.listID ?? '',
      name: list.name ?? '',
      prices: list.prices ?? 0,
      year: list.year ?? '',
      month: list.month ?? '',
      children: list.children ?? [],
    );
  }

  factory ListModel.fromChildMap(Map<String, dynamic> childList){
    return ListModel(
      listID: childList['listID'] ?? '',
      name: childList['name'] ?? '',
      prices: childList['prices'] ?? 0,
      year: childList['year'] ?? '',
      month: childList['month'] ?? '',
      children: childList['children'] ?? []
    );
  }
}