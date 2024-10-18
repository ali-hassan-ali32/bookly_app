import 'dart:developer';

import 'package:bloc/bloc.dart';

class AppBlocObserver extends BlocObserver {

  @override
  void onChange(BlocBase bloc, Change change) {
    log(change.toString());
    super.onChange(bloc, change);
  }
}