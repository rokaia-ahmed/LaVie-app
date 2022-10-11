class UserModel{
 late String userId;
 late String firstName;
 late String lastName;
 late String email;
 late String imageUrl;
 late dynamic address;
 late String role;
 late dynamic userPoints;
  List<dynamic> notification = [];

 UserModel.fromJson(Map<String,dynamic>json){
   userId = json['userId']??'';
   firstName = json['firstName']??'';
   lastName = json['lastName']??'';
   email = json['email']??'';
   imageUrl = json['imageUrl']??'';
   address = json['address']??'';
   role = json['role']??'';
   userPoints = json['UserPoints']?? 0;
   notification = json['UserNotification']??[];
 }

}