// ignore_for_file: strict_raw_type

import 'dart:developer';

import 'package:bloc/bloc.dart';

/// common [BlocObserver]
class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    log('$bloc created');
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    log('$bloc closed');
    super.onClose(bloc);
  }
}
