import 'package:shopping_app/features/home/data/models/category_brand_model.dart';
import 'package:shopping_app/features/home/domain/entities/ProductEntity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    this.results,
    this.metadata,
    super.data,
  });

  ProductModel.fromJson(dynamic json) {
    results = json['results'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ModelData.fromJson(v));
      });
    }
  }

  int? results;
  Metadata? metadata;
}

class ModelData extends ProductDataEntity {
  ModelData({
    super.sold,
    super.images,
    super.subcategory,
    super.ratingsQuantity,
    super.id,
    super.title,
    this.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    this.createdAt,
    this.updatedAt,
  });

  ModelData.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(Data.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category =
        json['category'] != null ? Data.fromJson(json['category']) : null;
    brand = json['brand'] != null ? Data.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

  String? slug;
  String? createdAt;
  String? updatedAt;
}
