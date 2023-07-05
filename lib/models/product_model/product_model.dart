
class ProductModelFields {
  static const String id = "_id";
  static const String name = "name";
  static const String image = "image";
  static const String count = "count";
  static const String productsTable = "shop";
}

class ProductModelSql {
  int? id;
  final String name;
  final String image;
  final int count;

  ProductModelSql({
    this.id,
    required this.image,
    required this.name,
    required this.count,
  });

  ProductModelSql copyWith({
    String? name,
    String? image,
    int? count,
    int? id,
  }) {
    return ProductModelSql(
      name: name ?? this.name,
      image: image ?? this.image,
      count: count ?? this.count,
      id: id ?? this.id,
    );
  }

  factory ProductModelSql.fromJson(Map<String, dynamic> json) {
    return ProductModelSql(
      name: json[ProductModelFields.name] ?? "",
      image: json[ProductModelFields.image] ?? "",
      count: json[ProductModelFields.count] ?? 1,
      id: json[ProductModelFields.id] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ProductModelFields.name: name,
      ProductModelFields.image: image,
      ProductModelFields.count: count,
    };
  }

  @override
  String toString() {
    return '''
      name: $name
      image: $image
      count: $count
      id: $id, 
    ''';
  }
}
