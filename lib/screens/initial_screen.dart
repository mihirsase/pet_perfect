import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_perfect/blocs/initial/initial_bloc.dart';
import 'package:pet_perfect/blocs/initial/initial_event.dart';

class InitialScreen extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const InitialScreen({
    Key? key,
    required final this.navigatorKey,
  }) : super(key: key);

  @override
  InitialScreenState createState() => InitialScreenState();
}

class InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(final BuildContext _) {
    return BlocProvider<InitialBloc>(
      create: (final BuildContext _) {
        return InitialBloc(
          navigatorKey: widget.navigatorKey,
        )..add(LoadApp());
      },
      child: BlocBuilder<InitialBloc, void>(
        builder: (final BuildContext _, final void state) {
          return _body();
        },
      ),
    );
  }

  Widget _body() {
    return const SafeArea(
      top: false,
      child: Scaffold(
        body: Center(
          child: Text(
            'Pet Perfect',
            style: TextStyle(
              fontSize: 32,
            ),
          ),
        ),
      ),
    );
  }
}
