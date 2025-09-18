import 'package:smart_ahwa_manger/cli/cli_service_input.dart';
import 'package:smart_ahwa_manger/cli/cli_service_output.dart';
import 'package:smart_ahwa_manger/cli/welcome_cli.dart';
import 'package:smart_ahwa_manger/services/services.dart';
import 'package:smart_ahwa_manger/interfaces/service.dart';

void main() {
  late WelcomeCli cli;

  final List<Service> services = [];

  cli = WelcomeCli(
    serviceInput: CliServiceInput(services: services),
    serviceOutput: CliServiceOutput(),
    services: services,
  );

  services.addAll([
    AddNewOrderService(welcomeCli: cli),
    ViewPendingOrdersService(welcomeCli: cli),
    CompleteOrderService(welcomeCli: cli),
    CancelOrderService(welcomeCli: cli),
    ShowReportService(welcomeCli: cli),
    ExitService(),
  ]);

  cli.start();
}
