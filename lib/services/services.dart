import 'package:smart_ahwa_manger/cli/add_new_order_cli.dart';
import 'package:smart_ahwa_manger/cli/cancel_order_cli.dart';
import 'package:smart_ahwa_manger/cli/cli_order_input.dart';
import 'package:smart_ahwa_manger/cli/cli_order_output.dart';
import 'package:smart_ahwa_manger/cli/cli_report_output.dart';
import 'package:smart_ahwa_manger/cli/complete_order_cli.dart';
import 'package:smart_ahwa_manger/cli/welcome_cli.dart';
import 'package:smart_ahwa_manger/services/generate_report_service.dart';
import 'package:smart_ahwa_manger/cli/view_pending_order_cli.dart';
import 'package:smart_ahwa_manger/interfaces/service.dart';
import 'package:smart_ahwa_manger/models/drink.dart';
import 'package:smart_ahwa_manger/services/order_service.dart';
import 'package:smart_ahwa_manger/services/report_service.dart';

class AddNewOrderService implements Service {
  final WelcomeCli _welcomeCli;
  final String _name = 'Add New Order';
  final int _num = 1;
  @override
  AddNewOrderService({required WelcomeCli welcomeCli})
    : _welcomeCli = welcomeCli;
  @override
  String get name => _name;
  @override
  int get num => _num;
  @override
  void showInfo() {
    print('$num. $name');
  }

  @override
  void execute() {
    AddNewOrderCli(
      welcomeCli: _welcomeCli,
      orderInput: CliOrderInput(),
      orderOutput: CliOrderOutput(),
      orderService: OrderService(),
      allDrinks: allDrinks,
    ).execute();
  }
}

class ViewPendingOrdersService implements Service {
  final String _name = 'View Pending Orders';
  final int _num = 2;
  final WelcomeCli _welcomeCli;
  @override
  ViewPendingOrdersService({required WelcomeCli welcomeCli})
    : _welcomeCli = welcomeCli;
  @override
  String get name => _name;
  @override
  int get num => _num;
  @override
  void showInfo() {
    print('$num. $name');
  }

  @override
  void execute() {
    ViewPendingOrderCli(
      orderOutput: CliOrderOutput(),
      welcomeCli: _welcomeCli,
    ).execute();
  }
}

class CompleteOrderService implements Service {
  final String _name = 'Complete Order';
  final int _num = 3;
  final WelcomeCli _welcomeCli;
  @override
  CompleteOrderService({required WelcomeCli welcomeCli})
    : _welcomeCli = welcomeCli;
  @override
  String get name => _name;
  @override
  int get num => _num;
  @override
  void showInfo() {
    print('$num. $name');
  }

  @override
  void execute() {
    CompleteOrderCli(
      orderService: OrderService(),
      orderInput: CliOrderInput(),
      orderOutput: CliOrderOutput(),
      welcomeCli: _welcomeCli,
    ).execute();
  }
}

class CancelOrderService implements Service {
  final String _name = 'Cancel Order';
  final int _num = 4;
  final WelcomeCli _welcomeCli;
  @override
  CancelOrderService({required WelcomeCli welcomeCli})
    : _welcomeCli = welcomeCli;
  @override
  String get name => _name;
  @override
  int get num => _num;
  @override
  void showInfo() {
    print('$num. $name');
  }

  @override
  void execute() {
    CancelOrderCli(
      welcomeCli: _welcomeCli,
      orderInput: CliOrderInput(),
      orderOutput: CliOrderOutput(),
      orderService: OrderService(),
    ).execute();
  }
}

class ShowReportService implements Service {
  final String _name = 'Show Report';
  final int _num = 5;
  final WelcomeCli _welcomeCli;
  @override
  ShowReportService({required WelcomeCli welcomeCli})
    : _welcomeCli = welcomeCli;
  @override
  String get name => _name;
  @override
  int get num => _num;
  @override
  void showInfo() {
    print('$num. $name');
  }

  @override
  void execute() {
    GenerateReportService(
      ReportService(OrderService()),
      CliReportOutput(),
      _welcomeCli,
    ).generateReport();
  }
}

class ExitService implements Service {
  final String _name = 'Exit';
  final int _num = 6;
  @override
  ExitService();
  @override
  String get name => _name;
  @override
  int get num => _num;
  @override
  void showInfo() {
    print('$num. $name');
  }

  @override
  void execute() {
    print('Goodbye and see you soon');
  }
}
