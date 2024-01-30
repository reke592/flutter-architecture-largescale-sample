library customs;

// import 'package:auth/auth.dart';
import 'package:commons/commons.dart';
// import 'package:flutter/material.dart';
export 'src/core/constants.dart';

/// {@template Customs}
/// template package to apply client specific customizations
/// {@endtemplate}
class Customs extends FeatureInstaller {

  /// {@macro Customs}
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
