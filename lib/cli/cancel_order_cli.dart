import 'package:smart_ahwa_manger/cli/welcome_cli.dart';
import 'package:smart_ahwa_manger/interfaces/order_input.dart';
import 'package:smart_ahwa_manger/interfaces/order_output.dart';
import 'package:smart_ahwa_manger/services/order_service.dart';

class CancelOrderCli {
  final OrderInput _orderInput;
  final OrderOutput _orderOutput;
  final OrderService _orderService;
  final WelcomeCli _welcomeCli;
  CancelOrderCli({
    required OrderInput orderInput,
    required OrderOutput orderOutput,
    required OrderService orderService,
    required WelcomeCli welcomeCli,
  }) : _orderInput = orderInput,
       _orderOutput = orderOutput,
       _orderService = orderService,
       _welcomeCli = welcomeCli;

  void execute() {
    final orderId = _orderInput.getOrderId();
    final order = _orderService.pendingOrders.firstWhere(
      (order) => order.id == orderId.toString(),
    );
    _orderService.cancelOrder(order);
    _orderOutput.printOrderTitle('Order Cancelled Successfully');
    _orderOutput.printOrder(order);
    _welcomeCli.start();
  }
}
