import 'package:shopping_app/features/home/domain/entities/Category_and_brand_entity.dart';

class ProductEntity {
  ProductEntity({
    this.data,
  });

  List<ProductDataEntity>? data;
}

class ProductDataEntity {
  ProductDataEntity({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
  });

  int? sold;
  List<String>? images;
  List<CategoryBrandDataEntity>? subcategory;
  int? ratingsQuantity;
  String? id;
  String? title;
  String? description;
  int? quantity;
  num? price;
  String? imageCover;
  CategoryBrandDataEntity? category;
  CategoryBrandDataEntity? brand;
  num? ratingsAverage;
}
