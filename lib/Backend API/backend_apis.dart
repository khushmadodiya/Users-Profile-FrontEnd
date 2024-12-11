import 'dart:convert';
import 'package:hotwax_crud/models/user_model.dart';
import 'package:http/http.dart'as http;
class CRUD{
  final String _baseurl = "http://localhost/flutter_backend";

  Future createUser({required Map<String,String> data})async{
    String res = "Some error occure";
    try{
      var response = await http.post(
          Uri.parse('$_baseurl/create.php'),
          body: jsonEncode(data)
      );
      var result = jsonDecode(response.body);
      if(result['success']==true){
        return {'res':"success",'msg':result['message']};
      }
      else{
        return { 'res': result['message']};
      }
    }
    catch(e){
      return {'res':'$res $e'};
    }
  }


  Future getAllUser()async{
    String res = "Some error occure";
    List<Map<String,dynamic>> data;
    try{
      var response = await http.get(
          Uri.parse('$_baseurl/read.php'),
      );
      var result = jsonDecode(response.body);
      if(result['success']==true){
        var re = result['data'];
        print(re);
        return {'res':"success",'msg':result['data']};
      }
      else{
        return { 'res': res};
      }
    }
    catch(e){
      return {'res':'$res $e'};
    }
  }

  Future updateUserProfile({required Map<String,dynamic> data})async{
    String res = "Some error occure";
    try{
      var response = await http.post(
          Uri.parse('$_baseurl/update.php'),
          body: jsonEncode(data)
      );
      var result = jsonDecode(response.body);
      if(result['success']==true){
        return {'res':"success",'msg':"Successfully Updated"};
      }
      else{
        return { 'res': result['message']};
      }
    }
    catch(e){
      return {'res':'$res $e'};
    }
  }
  Future deleteUserProfile({required Map<String,dynamic> data})async{
    String res = "Some error occure";
    try{
      var response = await http.post(
          Uri.parse('$_baseurl/delete.php'),
          body: jsonEncode(data)
      );
      var result = jsonDecode(response.body);
      if(result['success']==true){
        return {'res':"success",'msg':"Successfully Delete"};
      }
      else{
        return { 'res': result['message']};
      }
    }
    catch(e){
      return {'res':'$res $e'};
    }
  }

}