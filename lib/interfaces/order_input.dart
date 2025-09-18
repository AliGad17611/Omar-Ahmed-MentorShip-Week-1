import 'package:smart_ahwa_manger/models/drink.dart';

abstract class OrderInput {
  String getCustomerName();
  Drink getDrink(List<Drink> drinks);
  int getOrderId();
}
