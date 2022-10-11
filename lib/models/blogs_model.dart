class BlogsModel{
  String? id;
  String? name;
  String? description;
  String? imageUrl;
  int? waterCapacity;
  int? sunLight;
  int? temperature;

  BlogsModel.fromJson(Map<String,dynamic> json){
    id = json['plantId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl']??'';
    waterCapacity = json['waterCapacity'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];

  }

}