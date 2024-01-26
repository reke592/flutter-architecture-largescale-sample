import 'package:auth/auth.dart';
import 'package:commons/commons.dart';
import 'package:customs/customs.dart';
import 'package:dashboard/dashboard.dart';

part 'bootstrap.main.dart';

// application standard features
final appFeatures = <FeatureInstaller>[
  Auth(),
  Dashboard(),
];
