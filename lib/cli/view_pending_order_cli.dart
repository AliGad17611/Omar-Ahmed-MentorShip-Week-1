import 'package:smart_ahwa_manger/cli/welcome_cli.dart';
import 'package:smart_ahwa_manger/interfaces/order_output.dart';
import 'package:smart_ahwa_manger/services/order_service.dart';

class ViewPendingOrderCli {
  final OrderOutput _orderOutput;
  final WelcomeCli _welcomeCli;
  ViewPendingOrderCli({required OrderOutput orderOutput, required WelcomeCli welcomeCli})
    : _orderOutput = orderOutput,
      _welcomeCli = welcomeCli;

  void execute() {
    final pendingOrders = OrderService().pendingOrders;
    if (pendingOrders.isEmpty) {
      _orderOutput.printOrderTitle('No Pending Orders');
    } else {
      _orderOutput.printOrderTitle('Pending Orders');
      for (var order in pendingOrders) {
        _orderOutput.printOrder(order);
      }
      _welcomeCli.start();
    }
  }
}
