import 'dart:io';
import 'package:smart_ahwa_manger/models/drink.dart';
import 'package:smart_ahwa_manger/interfaces/order_input.dart';

class CliOrderInput implements OrderInput {
  @override
  String getCustomerName() {
    stdout.write('Enter the customer name: ');
    return stdin.readLineSync()!;
  }

  @override
  int getOrderId() {
    stdout.write('Enter the order id: ');
    return int.parse(stdin.readLineSync()!);
  }

  @override
  Drink getDrink(List<Drink> drinks) {
    for (var i = 0; i < drinks.length; i++) {
      drinks[i].showInfo(i + 1);
    }
    stdout.write('Enter the drink number: ');
    int drinkNum = int.parse(stdin.readLineSync()!);
    return drinks[drinkNum - 1];
  }
}
