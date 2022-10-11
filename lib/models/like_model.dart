class LikeModel {
  LikeModel({
    required this.type,
    required this.message,
    required this.data,
  });

  final String? type;
  final String? message;
  final Data? data;



  factory LikeModel.fromJson(Map<String, dynamic> json){
    return LikeModel(
      type: json["type"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.forumId,
    required this.userId,
  });
  final String? forumId;
  final String? userId;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      forumId: json["forumId"],
      userId: json["userId"],
    );
  }

}
