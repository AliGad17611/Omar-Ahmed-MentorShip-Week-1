import 'package:smart_ahwa_manger/interfaces/report_output.dart';
import 'package:smart_ahwa_manger/services/report_service.dart';

class CliReportOutput implements ReportOutput {
  @override
  void showReport(ReportService reportService) {
    print('\n${'=' * 50}');
    print(
      '📊 DAILY REPORT - ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
    );
    print('=' * 50);

    print('\n📋 ORDER SUMMARY:');
    print('   Total Orders: ${reportService.totalOrders}');
    print('   ✅ Completed: ${reportService.completedOrders}');
    print('   ⏳ Pending: ${reportService.pendingOrders}');
    print('   ❌ Cancelled: ${reportService.cancelledOrders}');

    print('\n💰 REVENUE SUMMARY:');
    print('   Daily Revenue: ${reportService.revenue} EGP');
    print(
      '   Average Order Value: ${reportService.averageOrderValue.toStringAsFixed(2)} EGP',
    );

    print('\n🏆 POPULAR DRINK:');
    print('   Most Ordered: ${reportService.mostPopularDrink}');

    print('=' * 50);
  }
}
