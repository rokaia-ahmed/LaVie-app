class LoginModel{
  String? type;
  String? message ;
  Data? data ;

  LoginModel.fromJson(Map<String,dynamic>json){
    type =json['type']??'';
    message =json['message']??'';
    data =json['data'] !=null? Data.fromJson(json['data']):null;
  }

}
class Data{
  String? accessToken;
  String? refreshToken;
  User? user;
  Data.fromJson(Map<String,dynamic>json){
    user = json['user'] !=null? User.fromJson(json['user']):null;
    accessToken= json['accessToken']??'';
    refreshToken =json['refreshToken']??'';
  }
}

class User{
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? imageUrl;
  String? address;
  String? role;

  User.fromJson(Map<String,dynamic> json){
    userId = json['userId']??'';
    firstName = json['firstName']??'';
    lastName = json['lastName']??'';
    email = json['email']??'';
    imageUrl = json['imageUrl']??'';
    address = json['address']??'';
    role = json['role']??'';
  }

}
