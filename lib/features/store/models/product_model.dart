class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  double salePrice;
  String thumbnail;
  String category;
  String? description;
  List<String>? images;

  ProductModel({
    required this.id,
    required this.stock,
    required this.price,
    required this.title,
    required this.thumbnail,
    required this.category,
    this.sku,
    this.salePrice = 0.0,
    this.description,
    this.images,
  });

  static ProductModel empty() => ProductModel(id: '', stock: 0, price: 0, title: '', thumbnail: '', category: '');

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'SKU': sku,
      'Title': title,
      'Stock': stock,
      'Price': price,
      'Images': images ?? [],
      'Thumbnail': thumbnail,
      'Category': category,
      'SalePrice': salePrice,
      'Description': description,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> data) {
    return ProductModel(
      id: data['Id'],
      title: data['Title'],
      sku: data['SKU'] ?? '',
      stock: data['Stock'],
      price: double.parse((data['Price']).toString()),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      thumbnail: data['Thumbnail'],
      category: data['Category'],
      salePrice: double.parse((data['SalePrice']).toString()),
      description: data['Description'] ?? '',
    );
  }
}
