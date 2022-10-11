class DetailsPostModel {
  DetailsPostModel({
    required this.type,
    required this.message,
    required this.data,
  });

  final String? type;
  final String? message;
  final Data? data;

  factory DetailsPostModel.fromJson(Map<String, dynamic> json){
    return DetailsPostModel(
      type: json["type"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
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
  final List<ForumLike> forumLikes;
  final List<ForumComment> forumComments;
  final User? user;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      forumId: json["forumId"],
      title: json["title"],
      description: json["description"],
      imageUrl: json["imageUrl"],
      userId: json["userId"],
      forumLikes: json["ForumLikes"] == null ? [] : List<ForumLike>.from(json["ForumLikes"]!.map((x) => ForumLike.fromJson(x))),
      forumComments: json["ForumComments"] == null ? [] : List<ForumComment>.from(json["ForumComments"]!.map((x) => ForumComment.fromJson(x))),
      user: json["user"] == null ? null : User.fromJson(json["user"]),
    );
  }

}

class ForumComment {
  ForumComment({
    required this.forumCommentId,
    required this.forumId,
    required this.userId,
    required this.comment,
    required this.createdAt,
  });

  final String? forumCommentId;
  final String? forumId;
  final String? userId;
  final String? comment;
  final DateTime? createdAt;

  factory ForumComment.fromJson(Map<String, dynamic> json){
    return ForumComment(
      forumCommentId: json["forumCommentId"],
      forumId: json["forumId"],
      userId: json["userId"],
      comment: json["comment"],
      createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    );
  }

}

class ForumLike {
  ForumLike({
    required this.forumId,
    required this.userId,
  });

  final String? forumId;
  final String? userId;

  factory ForumLike.fromJson(Map<String, dynamic> json){
    return ForumLike(
      forumId: json["forumId"],
      userId: json["userId"],
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