abstract class OrderStatus {
  String get status;
}

class PendingOrderStatus implements OrderStatus {
  @override
  String get status => 'Pending';
}

class CompletedOrderStatus implements OrderStatus {
  @override
  String get status => 'Completed';
}

class CancelledOrderStatus implements OrderStatus {
  @override
  String get status => 'Cancelled';
}
