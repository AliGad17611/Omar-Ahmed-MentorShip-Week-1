import 'package:smart_ahwa_manger/models/order.dart';

abstract class OrderOutput {
  void printOrderTitle(String title);
  void printOrder(Order order,);
}