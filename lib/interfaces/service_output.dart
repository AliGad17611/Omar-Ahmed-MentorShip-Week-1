import 'package:smart_ahwa_manger/interfaces/service.dart';

abstract class ServiceOutput {
  void showServices(List<Service> services);
  void showWelcomeMessage();
}
