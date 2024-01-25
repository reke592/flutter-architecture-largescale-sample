library auth;

import 'package:auth/auth.dart';
import 'package:auth/src/presentation/views/login_screen.dart';
import 'package:commons/commons.dart';
export 'src/route_names.dart';

/// A Calculator.
class Auth extends FeatureInstaller {
  Auth() : super(featureName: 'Auth');

  @override
  Future<void> initServiceContainer(GetIt inject) async {}

  @override
  void initRoutes(AppRouter router) {
    router.createRoute(
      uniqueName: kLoginRouteName,
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    );
  }

  @override
  List<SingleChildWidget> get rootProviders => [];
}
