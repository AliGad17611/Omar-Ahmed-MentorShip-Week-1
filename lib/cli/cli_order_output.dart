import 'package:smart_ahwa_manger/interfaces/order_output.dart';
import 'package:smart_ahwa_manger/models/order.dart';

class CliOrderOutput implements OrderOutput {
  @override
  void printOrderTitle(String title) {
    print(title);
  }

  @override
  void printOrder(Order order) {
    print('--------------------------------');
    print("id: ${order.id}");
    print("customerName: ${order.customerName}");
    print("drink: ${order.drink.name}");
    print("status: ${order.status.status}");
    print('--------------------------------');
  }
}
