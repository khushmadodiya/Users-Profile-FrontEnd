import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotwax_crud/Provider/provider.dart';
import 'package:provider/provider.dart';

import 'Widgets/custom_textfield.dart';

class CreateNewUser extends StatefulWidget{
  @override
  State<CreateNewUser> createState()=> _AllUsers();
}
class _AllUsers extends State<CreateNewUser>{
  @override
  Widget build (BuildContext context){
    return Consumer<UserProvider>(
      builder: (context,pro,child)=>
       Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width*.5,
          child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextField(controller: pro.nameController,hintText: 'Enter name',),
                  SizedBox(height: 20,),
                  CustomTextField(controller: pro.emailController,hintText: 'Enter email',),
                  SizedBox(height: 20,),
                  CustomTextField(controller: pro.phoneController,hintText: 'Enter phone',),
                  SizedBox(height: 30,),
                  ElevatedButton(onPressed: (){
                    pro.createUser();
                  }, child: Text("Create User"))
                ],
          ),
        ),
      ),
      ),
    );
  }
}