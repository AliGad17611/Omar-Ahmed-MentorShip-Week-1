import 'package:smart_ahwa_manger/models/drink.dart';
import 'package:smart_ahwa_manger/models/order.dart';
import 'package:smart_ahwa_manger/models/order_status.dart';

class OrderService {
  OrderService._internal();
  static final OrderService _instance = OrderService._internal();
  factory OrderService() => _instance;

  final List<Order> _orders = [];

  void addOrder(Drink drink, String customerName) {
    final order = Order(
      customerName: customerName,
      drink: drink,
      status: PendingOrderStatus(),
    );
    _orders.add(order);
  }

  void completeOrder(Order order) {
    order.setStatus(CompletedOrderStatus());
  }

  void cancelOrder(Order order) {
    order.setStatus(CancelledOrderStatus());
  }

  List<Order> get allOrders => List.unmodifiable(_orders);
  List<Order> get pendingOrders =>
      _orders.where((order) => order.status is PendingOrderStatus).toList();
  List<Order> get completedOrders =>
      _orders.where((order) => order.status is CompletedOrderStatus).toList();
  List<Order> get cancelledOrders =>
      _orders.where((order) => order.status is CancelledOrderStatus).toList();
}
