import 'package:whatever_app/features/store/models/cart_item_model.dart';
import 'package:whatever_app/utils/constants/enums.dart';
import 'package:whatever_app/utils/helpers/helper_functions.dart';

class OrderModel {
  final String id;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderDate;
  final String paymentMethod;
  final DateTime? deliveryDate;
  final List<CartItemModel> items;

  OrderModel({
    required this.id,
    required this.status,
    required this.items,
    required this.totalAmount,
    required this.orderDate,
    this.paymentMethod = 'Paypal',
    this.deliveryDate,
  });

  String get formattedOrderDate => THelperFunctions.getFormattedDate(orderDate);

  String get formattedDeliveryDate => deliveryDate != null ? THelperFunctions.getFormattedDate(deliveryDate!) : '';

  String get orderStatusText => status == OrderStatus.delivered
      ? 'Delivered'
      : status == OrderStatus.shipped
          ? 'Shipment on the way'
          : 'Processing';

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status.toString(), // Enum to string
      'totalAmount': totalAmount,
      'orderDate': orderDate,
      'paymentMethod': paymentMethod,
      'deliveryDate': deliveryDate,
      'items': items.map((item) => item.toJson()).toList(), // Convert CartItemModel to map
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> data) {
    return OrderModel(
      id: data['id'],
      status: OrderStatus.values.firstWhere((e) => e.toString() == data['status']),
      totalAmount: data['totalAmount'],
      orderDate: data['orderDate'],
      paymentMethod: data['paymentMethod'],
      deliveryDate: data['deliveryDate'],
      items: (data['items'] as List<dynamic>).map((itemData) => CartItemModel.fromJson(itemData as Map<String, dynamic>)).toList(),
    );
  }
}
