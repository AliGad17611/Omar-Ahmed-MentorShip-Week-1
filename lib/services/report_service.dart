import 'package:collection/collection.dart';
import 'package:smart_ahwa_manger/models/order_status.dart';
import 'package:smart_ahwa_manger/services/order_service.dart';

class ReportService {
  final OrderService _orderService;

  ReportService(this._orderService);

  int get totalOrders => _orderService.allOrders.length;
  int get pendingOrders => _orderService.pendingOrders.length;
  int get completedOrders => _orderService.completedOrders.length;
  int get cancelledOrders => _orderService.cancelledOrders.length;

  int get revenue => _orderService.allOrders
      .where((order) => order.status is CompletedOrderStatus)
      .fold(0, (sum, order) => sum + order.drink.price);

  double get averageOrderValue =>
      completedOrders == 0 ? 0 : revenue / completedOrders;

  String get mostPopularDrink {
    final completedOrdersList = _orderService.allOrders.where(
      (order) => order.status is CompletedOrderStatus,
    );

    if (completedOrdersList.isEmpty) return 'No completed orders';

    final grouped = groupBy(completedOrdersList, (o) => o.drink.name);
    final maxEntry = grouped.entries.reduce(
      (a, b) => a.value.length > b.value.length ? a : b,
    );
    return maxEntry.key;
  }
}
