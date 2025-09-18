import 'package:smart_ahwa_manger/cli/welcome_cli.dart';
import 'package:smart_ahwa_manger/interfaces/order_input.dart';
import 'package:smart_ahwa_manger/interfaces/order_output.dart';
import 'package:smart_ahwa_manger/models/drink.dart';
import 'package:smart_ahwa_manger/services/order_service.dart';

class AddNewOrderCli {
  final OrderInput _orderInput;
  final OrderOutput _orderOutput;
  final OrderService _orderService;
  final List<Drink> _allDrinks;
  final WelcomeCli _welcomeCli;
  AddNewOrderCli({
    required OrderInput orderInput,
    required OrderOutput orderOutput,
    required OrderService orderService,
    required List<Drink> allDrinks,
    required WelcomeCli welcomeCli,
  }) : _orderInput = orderInput,
       _orderOutput = orderOutput,
       _orderService = orderService,
       _allDrinks = allDrinks,
       _welcomeCli = welcomeCli;

  void execute() {
    String customerName = _orderInput.getCustomerName();
    Drink drink = _orderInput.getDrink(_allDrinks);
    _orderService.addOrder(drink, customerName);
    _orderOutput.printOrderTitle('New Order Added Successfully');
    _orderOutput.printOrder(_orderService.allOrders.last);
    _welcomeCli.start();
  }
}
