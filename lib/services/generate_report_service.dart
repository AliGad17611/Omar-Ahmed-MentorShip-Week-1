import 'package:smart_ahwa_manger/cli/welcome_cli.dart';
import 'package:smart_ahwa_manger/interfaces/report_output.dart';
import 'package:smart_ahwa_manger/services/report_service.dart';

class GenerateReportService {
  final ReportService _reportService;
  final ReportOutput _reportOutput;
  final WelcomeCli _welcomeCli;

  GenerateReportService(
    this._reportService,
    this._reportOutput,
    this._welcomeCli,
  );

  void generateReport() {
    _reportOutput.showReport(_reportService);
    _welcomeCli.start();
  }
}
