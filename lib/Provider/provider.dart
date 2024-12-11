import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hotwax_crud/Backend%20API/backend_apis.dart';
import 'package:hotwax_crud/models/user_model.dart';


class UserProvider with ChangeNotifier{
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool _loading = false;

  List<UserModel> _data =[];

  TextEditingController  get  nameController =>_nameController;
  TextEditingController  get  emailController =>_emailController;
  TextEditingController  get  phoneController =>_phoneController;
  List<dynamic> get data => _data;
  bool get loading => _loading;

  void updateLoader(){
    _loading = !_loading;
  }

  void clear(){
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    notifyListeners();
  }
  void createUser()async{
    Map<String,String> data = {
      'name':_nameController.text.trim(),
      'email':_emailController.text.trim(),
      'phone':_phoneController.text.trim(),
    };
    var res = await CRUD().createUser(data: data);
    if(res['res']=='success'){
      clear();
      Fluttertoast.showToast(msg: res['msg'],timeInSecForIosWeb: 4);
    }
    else{
      Fluttertoast.showToast(msg: res['res'],timeInSecForIosWeb: 4);
    }
    notifyListeners();
  }
  Future updateUser(String uid)async{
    Map<String,dynamic> data = {
      'name':_nameController.text.trim(),
      'email':_emailController.text.trim(),
      'phone':_phoneController.text.trim(),
      'id':  int.parse(uid)

    };
    var res = await CRUD().updateUserProfile(data: data,);
    if(res['res']=='success'){
      clear();
      Fluttertoast.showToast(msg: res['msg'],timeInSecForIosWeb: 4);
      return true;
    }
    else{

      Fluttertoast.showToast(msg: res['res'],timeInSecForIosWeb: 4);
      return false;
    }
    notifyListeners();
  }
  void deleteUser(String uid)async{
    Map<String,dynamic> data = {
      'id':  int.parse(uid)
    };
    var res = await CRUD().deleteUserProfile(data: data,);
    if(res['res']=='success'){
      clear();
      clearData();
      getAllUserList();
      Fluttertoast.showToast(msg: res['msg'],timeInSecForIosWeb: 4);

    }
    else{

      Fluttertoast.showToast(msg: res['res'],timeInSecForIosWeb: 4);
    }
    notifyListeners();
  }
  List<dynamic> interdata=[];
  void getAllUserList()async{
    clearData();
    var res = await  CRUD().getAllUser();
    interdata = res['msg'];
    for(int i=0;i<interdata.length;i++){
        _data.add(UserModel.fromJson(interdata[i] as Map<String,dynamic>));
    }
    print(_data);
    notifyListeners();
  }
  void clearData(){
    _data = [];
    notifyListeners();
  }




}