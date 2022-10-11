class ToolsModel{
  String? id;
  String? description;
  String? name;
  String? imageUrl;

  ToolsModel.fromJson(Map<String,dynamic> json){
    id=json['toolId'];
    description=json['description'];
    name=json['name'];
    imageUrl=json['imageUrl'];
  }
}