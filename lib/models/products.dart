import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

@JsonSerializable()
class ProductsModel {
  ProductsModel({
    this.products,
  });

  List<ProductModel>? products;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => _$ProductsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsModelToJson(this);
}

@JsonSerializable()
class ProductModel {
  ProductModel({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discount,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
  });

  int? id;
  String? title;
  String? description;
  int? price;
  @JsonKey(name: 'discountPercentage')
  double? discount;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
