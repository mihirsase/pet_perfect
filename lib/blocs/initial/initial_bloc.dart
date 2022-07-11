import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pet_perfect/blocs/initial/initial_event.dart';
import 'package:pet_perfect/services/wayfinder.dart';

class InitialBloc extends Bloc<InitialEvent, void> {
  final GlobalKey<NavigatorState> navigatorKey;

  InitialBloc({
    required final this.navigatorKey,
  }) : super(null) {
    on<LoadApp>(_onLoadApp);
    Wayfinder.instance.navigatorKey = navigatorKey;
  }

  Future<void> _onLoadApp(LoadApp event, Emitter<void> emit) async {
    await SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    await Hive.initFlutter();

    await Future.delayed(const Duration(seconds: 2));

    Wayfinder.instance.dogImageScreen();
  }
}
