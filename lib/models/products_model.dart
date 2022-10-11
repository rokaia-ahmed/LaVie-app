class ProductModel{
String? productId;
String? name;
String? description;
String? imageUrl;
String? type;
int? price;
bool? available;

ProductModel.fromJson(Map<String,dynamic>json){
  productId =json['productId'];
  name =json['name'];
  description =json['description'];
  imageUrl =json['imageUrl'];
  type =json['type'];
  price =json['price'];
  available =json['available'];
}

}