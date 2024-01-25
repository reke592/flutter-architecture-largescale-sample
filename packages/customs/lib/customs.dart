library customs;

// import 'package:auth/auth.dart';
import 'package:commons/commons.dart';
// import 'package:flutter/material.dart';

class Customs extends FeatureInstaller {
  Customs() : super(featureName: 'Customs');

  @override
  Future<void> initServiceContainer(GetIt inject) async {}

  @override
  void initRoutes(AppRouter router) {
    // router.createRoute(
    //   override: true,
    //   uniqueName: kLoginRouteName,
    //   path: '/login',
    //   builder: (context, state) => Material(
    //     child: Placeholder(
    //       child: Center(
    //         child: Text(
    //           'Custom Login Screen',
    //           style: Theme.of(context).textTheme.headlineMedium,
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }

  @override
  List<SingleChildWidget> get rootProviders => [];
}
