import 'package:commons/commons.dart' deferred as commons
    show MultiProvider, Bloc, AppBlocObserver;
import 'package:flutter/material.dart';
import 'package:largescale/src/core/bootstrap.dart' deferred as boot;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await commons.loadLibrary();
  await boot.loadLibrary();
  commons.Bloc.observer = commons.AppBlocObserver();
  await boot.bootstrap();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return commons.MultiProvider(
      providers: boot.rootProviders,
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: boot.routerConfig(),
      ),
    );
  }
}
