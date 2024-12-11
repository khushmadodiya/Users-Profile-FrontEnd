import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotwax_crud/Provider/provider.dart';
import 'package:provider/provider.dart';

import 'home.dart';

void main(){
  runApp(
      ChangeNotifierProvider(
      create: (_)=>UserProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
    @override
  Widget build(BuildContext context) {
     return MaterialApp(
       title: "HotWax CRUD",
       debugShowCheckedModeBanner: false,
       home: Home(),
     );
  }
}