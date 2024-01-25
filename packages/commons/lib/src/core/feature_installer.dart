import 'package:commons/commons.dart';
export 'package:provider/single_child_widget.dart';

/// {@template CustomRegistrant}
/// Application customization registrant interface
/// {@endtemplate}
abstract class FeatureInstaller {
  /// {@macro CustomRegistrant}
  FeatureInstaller({required this.featureName});

  /// name of client who requested this customizations
  final String featureName;

  /// service container registration
  Future<void> initServiceContainer(GetIt inject);

  /// feature routes registration
  void initRoutes(AppRouter router);

  /// providers to inject in material app parent
  List<SingleChildWidget> get rootProviders;
}
