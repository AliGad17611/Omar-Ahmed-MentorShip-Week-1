import 'package:smart_ahwa_manger/cli/welcome_cli.dart';
import 'package:smart_ahwa_manger/interfaces/order_input.dart';
import 'package:smart_ahwa_manger/interfaces/order_output.dart';
import 'package:smart_ahwa_manger/services/order_service.dart';

class CompleteOrderCli {
  final OrderInput _orderInput;
  final OrderService _orderService;
  final OrderOutput _orderOutput;
  final WelcomeCli _welcomeCli;
  CompleteOrderCli({
    required OrderService orderService,
    required OrderInput orderInput,
    required OrderOutput orderOutput,
    required WelcomeCli welcomeCli,
  }) : _orderService = orderService,
       _orderInput = orderInput,
       _orderOutput = orderOutput,
       _welcomeCli = welcomeCli;

  void execute() {
    final orderId = _orderInput.getOrderId();
    final order = _orderService.pendingOrders.firstWhere(
      (order) => order.id == orderId.toString(),
    );
    _orderService.completeOrder(order);
    _orderOutput.printOrderTitle('Order Completed Successfully');
    _orderOutput.printOrder(order);
    _welcomeCli.start();
  }
}
