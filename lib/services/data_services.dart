import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class DataServices{

 Future<List<dynamic>> getUsers() async {
 var info =  rootBundle.loadString("json/data.json");
 List<dynamic> list = json.decode(await info);
 //print(list);
 return  Future.delayed(Duration(seconds: 1), // emulate server delay
     ()=> list.map((e) => e).toList() // Error function
 ); //server load Delay handler


  }
}