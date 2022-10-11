class UpdateUserModel{
  String? type;
  String? message ;
  Data? data ;
  UpdateUserModel.fromJson(Map<String,dynamic>json){
    type =json['type']??'';
    message =json['message']??'';
    data = json['data'] !=null ? Data.fromJson(json['data']):null;
  }
}

class Data{
  late String userId;
  late String firstName;
  late String lastName;
  late String email;
  late String imageUrl;
  late dynamic address;
  late String role;



  Data.fromJson(Map<String,dynamic>json){
    userId = json['userId']??'';
    firstName = json['firstName']??'';
    lastName = json['lastName']??'';
    email = json['email']??'';
    imageUrl = json['imageUrl']??'';
    address = json['address']??'';
    role = json['role']??'';
  }

}