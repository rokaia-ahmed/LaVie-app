class MyPostsModel {
  MyPostsModel({
    required this.type,
    required this.message,
    required this.data,
  });

  final String? type;
  final String? message;
  final List<MyData> data;

  factory MyPostsModel.fromJson(Map<String, dynamic> json){
    return MyPostsModel(
      type: json["type"],
      message: json["message"],
      data: json["data"] == null ? [] : List<MyData>.from(json["data"]!.map((x) => MyData.fromJson(x))),
    );
  }

}

class MyData {
  MyData({
    required this.forumId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.userId,
    required this.forumLikes,
    required this.forumComments,
    required this.user,
  });

  final String? forumId;
  final String? title;
  final String? description;
  final String? imageUrl;
  final String? userId;
  final List<dynamic> forumLikes;
  final List<dynamic> forumComments;
  final User? user;

  factory MyData.fromJson(Map<String, dynamic> json){
    return MyData(
      forumId: json["forumId"],
      title: json["title"],
      description: json["description"],
      imageUrl: json["imageUrl"]??'',
      userId: json["userId"],
      forumLikes: json["ForumLikes"] == null ? [] : List<dynamic>.from(json["ForumLikes"]!.map((x) => x)),
      forumComments: json["ForumComments"] == null ? [] : List<dynamic>.from(json["ForumComments"]!.map((x) => x)),
      user: json["user"] == null ? null : User.fromJson(json["user"]),
    );
  }

}

class User {
  User({
    required this.firstName,
    required this.lastName,
    required this.imageUrl,
  });

  final String? firstName;
  final String? lastName;
  final String? imageUrl;

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      firstName: json["firstName"],
      lastName: json["lastName"],
      imageUrl: json["imageUrl"],
    );
  }

}
