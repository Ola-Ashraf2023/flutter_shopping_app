class CategoryBrandEntity {
  CategoryBrandEntity({this.data});

  List<CategoryBrandDataEntity>? data;
}

class CategoryBrandDataEntity {
  CategoryBrandDataEntity({
    this.id,
    this.name,
    this.image,
  });

  String? id;
  String? name;
  String? image;
}
