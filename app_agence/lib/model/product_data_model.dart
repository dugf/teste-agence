class ProductDataModel {
  int? id;
  String? name;
  String? category;
  String? imageURL;
  String? description;
  String? price;
  ProductDataModel(
      {this.id,
      this.name,
      this.category,
      this.imageURL,
      this.description,
      this.price});

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    imageURL = json['imageUrl'];
    description = json['description'];
    price = json['price'];
  }
}
