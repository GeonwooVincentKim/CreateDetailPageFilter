import 'package:ListDepthLevel/model/List.dart';
import 'package:ListDepthLevel/page/Parents.dart';
import 'package:ListDepthLevel/page/child.dart';
import 'package:ListDepthLevel/page/create_page/create_childs.dart';
import 'package:ListDepthLevel/page/create_page/create_parents.dart';
import 'package:ListDepthLevel/page/detail.dart';
import 'package:ListDepthLevel/provider/ListProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget{
  ListModel menuList;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ListProvider()),
      ],
      child: MaterialApp(
        title: "ListDepth",
        initialRoute: "/",
        routes: {
          "/": (context) => Parents(),
          "/createParents": (context) => CreateParents(),
          "/createChilds": (context) => CreateChild(),
        },
        onGenerateRoute: (RouteSettings settings){
          final List<String> pathElements = settings.name.split("/");
          if(pathElements[0] != '') return null;
          if(pathElements[1] == 'parent') {
            String levelID = pathElements[2];
            return MaterialPageRoute(builder: (BuildContext context) => Child(childID: levelID));
          }else if(pathElements[1] == 'child'){
            String levelID = pathElements[2];
            return MaterialPageRoute(builder: (BuildContext context) => Detail(detailID: levelID));
          }else if(pathElements[1] == 'filter'){
            String levelID = pathElements[2];
            return MaterialPageRoute(builder: (BuildContext context) => Child(childID: levelID)); // Gonna change this
          }
        },
        onUnknownRoute: (RouteSettings settings){
          return MaterialPageRoute(builder: (BuildContext context) => MyApp());
        },
      ),
    );
  }
}
