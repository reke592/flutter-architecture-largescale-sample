library dashboard;

import 'package:commons/commons.dart';
import 'package:dashboard/src/core/constants.dart';
import 'package:dashboard/src/presentation/views/dashboard_screen.dart';
export 'src/core/constants.dart';

/// A Dashboard.
class Dashboard extends FeatureInstaller {
  Dashboard({super.featureName = 'Dashboard'});

  @override
  void initRoutes(AppRouter router) {
    router.createRoute(
      uniqueName: kDashboardRouteName,
      path: '/dashboard',
      builder: (context, state) => const DashboardScreen(),
    );
  }

  @override
  Future<void> initServiceContainer(GetIt inject) async {}

  @override
  List<SingleChildWidget> get rootProviders => [];
}
