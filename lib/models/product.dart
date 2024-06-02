class Product {

  int? id;
  String? name;
  String? price;
  String? regularPrice;
  String? salePrice;
  bool? onSale;
  bool? purchasable;
  int? totalSale;
  List<String>? images;

  Product({this.id, this.name, this.price, this.regularPrice, this.salePrice,
    this.onSale, this.purchasable, this.totalSale, this.images});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? null;
    name = json['name'] ?? '';
    price = json['price'] ?? '';
    regularPrice = json['regular_price'] ?? '';
    salePrice = json['sale_price'] ?? '';
    onSale = json['on_sale'] ?? false;
    purchasable = json['purchasable'] ?? false;
    totalSale = json['total_sales'] ?? 0;
    images = json['images'] == null ? [] : List<String>.from(json['images'].map((image) => image['src']));
  }
}