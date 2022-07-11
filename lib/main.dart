import 'package:flutter/material.dart';
import 'package:pet_perfect/screens/initial_screen.dart';

void main() {
  runApp(const PetPerfect());
}

class PetPerfect extends StatefulWidget {
  const PetPerfect({Key? key}) : super(key: key);

  @override
  State<PetPerfect> createState() => _PetPerfectState();
}

class _PetPerfectState extends State<PetPerfect> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      title: 'Pet Perfect',
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child!,
        );
      },
      home: InitialScreen(
        navigatorKey: _navigatorKey,
      ),
    );
  }
}
