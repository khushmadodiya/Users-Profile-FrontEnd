import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotwax_crud/Provider/provider.dart';
import 'package:hotwax_crud/models/user_model.dart';
import 'package:provider/provider.dart';

import 'Widgets/custom_textfield.dart';

class UpdateUser extends StatefulWidget{
  final UserModel model;
  UpdateUser({required this.model});
  @override
  State<UpdateUser> createState()=> _AllUsers();
}
class _AllUsers extends State<UpdateUser>{
  @override
  void initState() {
    // TODO: implement initState
    getdata();
  }
  getdata(){
   var pro=  Provider.of<UserProvider>(context,listen: false);
    pro.nameController.text = widget.model.name;
    pro.emailController.text = widget.model.email;
    pro.phoneController.text = widget.model.phone;
  }
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
                    ElevatedButton(onPressed: ()async{
                      print("this is id ${widget.model.uid}");
                    var res = await  pro.updateUser(widget.model.uid);
                      if(res){
                        pro.clearData();
                        pro.getAllUserList();
                        Navigator.pop(context);
                      }

                    }, child: const Text("Update User"))
                  ],
                ),
              ),
            ),
          ),
    );
  }
}