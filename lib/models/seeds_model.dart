class SeedsModel{
  String? id;
  String? description;
  String? name;
  String? imageUrl;

  SeedsModel.fromJson(Map<String,dynamic> json){
    id=json['seedId'];
    description=json['description'];
    name=json['name'];
    imageUrl=json['imageUrl'];
  }
}