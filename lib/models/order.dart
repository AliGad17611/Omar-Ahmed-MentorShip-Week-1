import 'package:smart_ahwa_manger/models/drink.dart';
import 'package:smart_ahwa_manger/models/order_status.dart';
import 'package:smart_ahwa_manger/services/order_service.dart';

class Order {
  final String _id;
  final String _customerName;
  final Drink _drink;
  OrderStatus _status;

  Order({
    required String customerName,
    required Drink drink,
    required OrderStatus status,
  }) : _id = _generateId(),
       _customerName = customerName,
       _drink = drink,
       _status = status;

  static String _generateId() {
    return (OrderService().allOrders.length + 1).toString();
  }

  void setStatus(OrderStatus status) {
    _status = status;
  }

  String get id => _id;
  String get customerName => _customerName;
  Drink get drink => _drink;
  OrderStatus get status => _status;
}

