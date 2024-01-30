part of 'bootstrap.dart';

/// providers to inject in material app parent from all app features
final rootProviders = <SingleChildWidget>[];

/// bootstrap feature
Future<void> _bootStrap(FeatureInstaller feature) async {
  await feature.initServiceContainer(inject);
  feature.initRoutes(inject());

  if (feature.rootProviders.isNotEmpty) {
    rootProviders.addAll(feature.rootProviders);
  }
}

/// initialize service container and application features
Future<void> bootstrap() async {
  // register app router
  inject.registerLazySingleton(AppRouter.new);

  // bootstrap all standard features
  for (final feature in appFeatures) {
    await _bootStrap(feature);
  }

  // splash / loading screen redirect logic
  inject<AppRouter>().createRoute(
    uniqueName: '/',
    path: '/',
    redirect: (context, state) {
      if (!context.read<AuthProvider>().isAuth) {
        Future.microtask(
          () => context.router.pushReplacementNamed(kLoginRouteName),
        );
      }
      return null;
    },
    builder: (context, state) => const LoadingScreen(),
  );

  // application customizations
  await _bootStrap(Customs());

  inject<AppRouter>().build();
}
