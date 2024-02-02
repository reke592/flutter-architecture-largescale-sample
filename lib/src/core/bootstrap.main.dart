part of 'bootstrap.dart';

/// providers to inject in material app parent from all app modules
final rootProviders = <SingleChildWidget>[];

/// bootstrap module
Future<void> _bootStrap(ModuleInstaller module) async {
  await module.initServiceContainer(inject);
  module
    ..initRoutes(inject())
    ..pubSub(inject());
  if (module.rootProviders.isNotEmpty) {
    rootProviders.addAll(module.rootProviders);
  }
}

/// initialize service container and application modules
Future<void> bootstrap() async {
  // common services
  inject
    ..registerLazySingleton(AppRouter.new)
    ..registerLazySingleton(EventBus.new)
    ..registerFactory(() => AppBarNavBloc(eventBus: inject()));

  // all standard modules
  for (final module in appModules) {
    await _bootStrap(module);
  }

  // customizations
  await _bootStrap(Customs());

  // router
  inject<AppRouter>()
    ..createRoute(
      uniqueName: 'redirect',
      path: '/redirect',
      redirect: (context, state) {
        if (!context.read<AuthProvider>().isAuth) {
          Future.delayed(
            const Duration(seconds: 1),
            () => context.router.pushReplacementNamed(kLoginRouteName),
          );
        } else {
          Future.delayed(
            const Duration(seconds: 1),
            () => context.router.pushReplacementNamed('/'),
          );
        }
        return null;
      },
      builder: (context, state) => const LoadingScreen(),
    )
    ..createRoute(
      uniqueName: '/',
      path: '/',
      builder: (context, state) => BlocProvider(
        create: (_) => inject<AppBarNavBloc>(),
        child: const LandingScreen(),
      ),
    )
    ..build(initialRoute: '/redirect');
}
