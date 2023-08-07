class DataModel {
  final double price;

  DataModel({required this.price});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      price: json['price'],
    );
  }
}
