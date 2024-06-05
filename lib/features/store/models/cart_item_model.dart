class CartItemModel {
  String productId;
  String title;
  double price;
  String? image;
  int quantity;

  /// Constructor
  CartItemModel({
    required this.productId,
    required this.quantity,
    this.image,
    this.price = 0.0,
    this.title = '',
  });

  /// Empty Cart
  static CartItemModel empty() => CartItemModel(productId: '', quantity: 0);

  /// Convert o CortItem to a JSON Map
  Map<String, dynamic> toJson() {
    return {
      "productId": productId,
      "title": title,
      "price": price,
      "image": image,
      "quantity": quantity,
    };
  }

  /// Create a CartItem from a JSON Map
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['productId'],
      title: json['title'],
      price: json['price']?.toDouble(),
      image: json['image'],
      quantity: json['quantity'],
    );
  }
}
