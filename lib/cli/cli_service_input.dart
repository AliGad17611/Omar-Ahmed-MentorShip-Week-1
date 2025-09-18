import 'dart:io';
import 'package:smart_ahwa_manger/interfaces/service.dart';
import 'package:smart_ahwa_manger/interfaces/service_input.dart';

class CliServiceInput implements ServiceInput {
  final List<Service> _services;
  CliServiceInput({required List<Service> services}) : _services = services;
  @override
  void selectService(int maxServiceNum) {
    stdout.write('Enter the service number: ');
    int serviceNum = int.parse(stdin.readLineSync()!);
    if (serviceNum > maxServiceNum || serviceNum < 1) {
      print('Invalid service number');
      selectService(maxServiceNum);
    } else {
      _services[serviceNum - 1].execute();
    }
  }
}
