class ProductModel {
  List<DataModel>? data;

  ProductModel(this.data);

}

class DataModel {
  String? name;
  String? thumbnailImage;
  int? basePrice;

  DataModel(this.name, this.thumbnailImage, this.basePrice);
}