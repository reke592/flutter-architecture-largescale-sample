import 'package:commons/commons.dart';
export 'package:provider/single_child_widget.dart';

/// {@template ModuleInstaller}
/// Application customization registrant interface
/// {@endtemplate}
abstract class ModuleInstaller {
  /// {@macro ModuleInstaller}
  ModuleInstaller({required this.featureName});

  /// name of client who requested this customizations
  final String featureName;

  /// service container registration
  Future<void> initServiceContainer(GetIt inject);

  /// feature routes registration
  void initRoutes(AppRouter router);

  /// providers to inject in material app parent
  List<SingleChildWidget> get rootProviders;

  /// global message bus PubSub
  void pubSub(EventBus bus);
}
