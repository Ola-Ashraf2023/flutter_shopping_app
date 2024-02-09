import 'package:shopping_app/features/home/domain/entities/Category_and_brand_entity.dart';


class CategoryBrandModel extends CategoryBrandEntity {
  CategoryBrandModel({
    this.results,
    this.metadata,
    super.data,
  });

  CategoryBrandModel.fromJson(dynamic json) {
    results = json['results'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }

  int? results;
  Metadata? metadata;
}

class Data extends CategoryBrandDataEntity {
  Data({
    super.id,
    super.name,
    this.slug,
    super.image,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? slug;
  String? createdAt;
  String? updatedAt;
}

class Metadata {
  Metadata({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }

  int? currentPage;
  int? numberOfPages;
  int? limit;
}
