import 'package:smart_ahwa_manger/interfaces/service.dart';
import 'package:smart_ahwa_manger/interfaces/service_input.dart';
import 'package:smart_ahwa_manger/interfaces/service_output.dart';

class WelcomeCli {
  final ServiceInput _serviceInput;
  final ServiceOutput _serviceOutput;
  final List<Service> _services;
  WelcomeCli({
    required ServiceInput serviceInput,
    required ServiceOutput serviceOutput,
    required List<Service> services,
  }) : _serviceInput = serviceInput,
       _serviceOutput = serviceOutput,
       _services = services;

  void start() {
    _serviceOutput.showWelcomeMessage();
    _serviceOutput.showServices(_services);
    _serviceInput.selectService(_services.length);
  }
}
