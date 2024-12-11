import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotwax_crud/all_users.dart';
import 'package:hotwax_crud/create_user.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget{
  @override
  State<Home> createState()=>_Home();
}
class _Home extends State<Home> with SingleTickerProviderStateMixin{
 late TabController _controller ;
 @override
  void initState() {
    // TODO: implement initState

   _controller = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(context){
    return Scaffold(
      appBar: AppBar(
        title: Text("HotWax"),
        bottom: TabBar(
          controller: _controller,
           tabs: [
             Tab(child: Text("All Users"),),
             Tab(child: Text("Create User"),),

           ],
        ) ,
      ),

      body: Consumer(
          builder: (context,pro,child)=>
          TabBarView(
          controller:  _controller,
            children: [
               AllUsers(),
               CreateNewUser()
            ]
        ),
      )

    );
  }
}

