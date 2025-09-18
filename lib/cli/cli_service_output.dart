import 'package:smart_ahwa_manger/interfaces/service.dart';
import 'package:smart_ahwa_manger/interfaces/service_output.dart';

class CliServiceOutput implements ServiceOutput {
  @override
  void showServices(List<Service> services) {
    for (var service in services) {
      service.showInfo();
    }
  }

  @override
  void showWelcomeMessage() {
    print('Welcome to the Smart AHWA Manager');
  }
}
