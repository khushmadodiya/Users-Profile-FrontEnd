import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotwax_crud/Provider/provider.dart';
import 'package:hotwax_crud/models/user_model.dart';
import 'package:hotwax_crud/update_user.dart';
import 'package:provider/provider.dart';

class AllUsers extends StatefulWidget{
  @override
  State<AllUsers> createState()=> _AllUsers();
}

class _AllUsers extends State<AllUsers> {
  @override
  void initState() {
    // TODO: implement initState
    getdata();
  }

  getdata() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var pro = Provider.of<UserProvider>(context, listen: false);
      pro.updateLoader();
      pro.getAllUserList();
      pro.updateLoader();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
        builder: (context, pro, child) {
          if (pro.loading) {
            return Center(child: CircularProgressIndicator());
          }
          return Scaffold(
            body: Container(
              // child: Text("hello"),
              child: ListView.builder(
                  itemCount: pro.data.length,
                  itemBuilder: (context, index) {
                    return card(pro.data[index],pro);
                    // return Text("hello");
                  }),
            ),
          );
        });
  }


  Widget card(UserModel model,UserProvider pro) {

    return Column(
      children: [
        Container(
          // height: 200,
          width: MediaQuery
              .of(context)
              .size
              .width * .8,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(10)
          ),
          child: ListTile(
            contentPadding: EdgeInsets.all(5),
            title: Text('Name:  ${model.name}',style: TextStyle(fontWeight:FontWeight.bold),),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Email:     ${model.email}',style: TextStyle(fontWeight:FontWeight.bold),),
                SizedBox(width: 5,),
                Text('Phone:   ${model.phone}',style: TextStyle(fontWeight:FontWeight.bold),)
              ],
            ),
            trailing: Column(
              children: [
                InkWell(
                  child: Container(
                decoration: BoxDecoration(
                  color: Colors.green.shade400,
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(20),
                  
                ),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Update",style: TextStyle(color: Colors.white,fontSize: 13),),
                  ),
                  onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateUser(model: model))),
                ),
               SizedBox(height: 6,),
               InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red.shade400,
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(20),

                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Delete",style: TextStyle(color: Colors.white,fontSize: 13))),
                   onTap: (){
                     pro.deleteUser(model.uid);
                    },
                )
              ],
            )
          ),
        ),
        SizedBox(height: 20,)
      ],
    );
  }
}