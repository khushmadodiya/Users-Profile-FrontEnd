class UserModel{
  final String name;
  final String uid;
  final String email;
  final String phone;
  UserModel( { required this.uid,required this.name,required this.email,required this.phone});

  factory UserModel.fromJson(Map<String,dynamic>json){
    return UserModel(name: json['name'], email: json['email'], phone: json['phone'], uid: json['uid']);
  }

  Map<String, dynamic> toJson(){
     return {
       'name':name,
       'email':email,
       'phone':phone,
       'uid' : uid,
     };
  }

}