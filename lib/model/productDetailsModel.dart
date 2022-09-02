class ProductDetailsModel {
  List<ProductDetailsModelData>? categoryProductModelDataList;
  bool? success;
  int? status;

  ProductDetailsModel({this.categoryProductModelDataList, this.success, this.status});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      categoryProductModelDataList = <ProductDetailsModelData>[];
      json['data'].forEach((v) {
        categoryProductModelDataList!.add(new ProductDetailsModelData.fromJson(v));
      });
    }
    success = json['success'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categoryProductModelDataList != null) {
      data['data'] = this.categoryProductModelDataList!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['status'] = this.status;
    return data;
  }
}

class ProductDetailsModelData {
  int? id;
  String? name;
  String? addedBy;
  int? sellerId;
  int? shopId;
  String? shopName;
  String? shopLogo;
  List<String>? photos;
  String? thumbnailImage;
  List<String>? tags;
  String? priceHighLow;
  bool? hasDiscount;
  String? strokedPrice;
  String? mainPrice;
  int? calculablePrice;
  String? currencySymbol;
  int? currentStock;
  String? unit;
  int? rating;
  int? ratingCount;
  int? earnPoint;
  String? description;

  ProductDetailsModelData(
      {this.id,
        this.name,
        this.addedBy,
        this.sellerId,
        this.shopId,
        this.shopName,
        this.shopLogo,
        this.photos,
        this.thumbnailImage,
        this.tags,
        this.priceHighLow,
        this.hasDiscount,
        this.strokedPrice,
        this.mainPrice,
        this.calculablePrice,
        this.currencySymbol,
        this.currentStock,
        this.unit,
        this.rating,
        this.ratingCount,
        this.earnPoint,
        this.description});

  ProductDetailsModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    addedBy = json['added_by'];
    sellerId = json['seller_id'];
    shopId = json['shop_id'];
    shopName = json['shop_name'];
    shopLogo = json['shop_logo'];
    photos = json['photos'].cast<String>();
    thumbnailImage = json['thumbnail_image'];
    tags = json['tags'].cast<String>();
    priceHighLow = json['price_high_low'];
    hasDiscount = json['has_discount'];
    strokedPrice = json['stroked_price'];
    mainPrice = json['main_price'];
    calculablePrice = json['calculable_price'];
    currencySymbol = json['currency_symbol'];
    currentStock = json['current_stock'];
    unit = json['unit'];
    rating = json['rating'];
    ratingCount = json['rating_count'];
    earnPoint = json['earn_point'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['added_by'] = this.addedBy;
    data['seller_id'] = this.sellerId;
    data['shop_id'] = this.shopId;
    data['shop_name'] = this.shopName;
    data['shop_logo'] = this.shopLogo;
    data['photos'] = this.photos;
    data['thumbnail_image'] = this.thumbnailImage;
    data['tags'] = this.tags;
    data['price_high_low'] = this.priceHighLow;
    data['has_discount'] = this.hasDiscount;
    data['stroked_price'] = this.strokedPrice;
    data['main_price'] = this.mainPrice;
    data['calculable_price'] = this.calculablePrice;
    data['currency_symbol'] = this.currencySymbol;
    data['current_stock'] = this.currentStock;
    data['unit'] = this.unit;
    data['rating'] = this.rating;
    data['rating_count'] = this.ratingCount;
    data['earn_point'] = this.earnPoint;
    data['description'] = this.description;
    return data;
  }
}