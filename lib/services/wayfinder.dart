import 'package:flutter/material.dart';
import 'package:pet_perfect/screens/dog_image/dog_image_screen.dart';
import 'package:pet_perfect/screens/posts/posts_screen.dart';
import 'package:pet_perfect/screens/saved_images/saved_images_screen.dart';

class Wayfinder {
  static final Wayfinder instance = Wayfinder._();

  Wayfinder._();

  GlobalKey<NavigatorState>? _navigatorKey;

  set navigatorKey(final GlobalKey<NavigatorState> navigatorKey) {
    _navigatorKey = navigatorKey;
  }

  BuildContext get context {
    return _navigatorKey!.currentState!.context;
  }

  void pop() {
    _navigatorKey!.currentState!.pop();
  }

  void popUntilFirst() {
    _navigatorKey!.currentState!.popUntil((final Route currentRoute) {
      return currentRoute.isFirst;
    });
  }

  void popUntil({
    required final Type route,
  }) {
    _navigatorKey!.currentState!.popUntil((final Route currentRoute) {
      return currentRoute.settings.name == route.toString();
    });
  }

  void _push({
    required final MaterialPageRoute materialPageRoute,
  }) {
    _navigatorKey!.currentState!.push(materialPageRoute);
  }

  void _replace({
    required final dynamic materialPageRoute,
  }) {
    _navigatorKey!.currentState!.pushAndRemoveUntil(
      materialPageRoute,
          (final Route<dynamic> route) {
        return false;
      },
    );
  }

  void _pushAndReplace({
    required final MaterialPageRoute materialPageRoute,
  }) {
    _navigatorKey!.currentState!.pushAndRemoveUntil(
      materialPageRoute,
          (final Route<dynamic> route) {
        return route.isFirst;
      },
    );
  }



  void dogImageScreen() {
    _replace(
      materialPageRoute: MaterialPageRoute(
        builder: (final BuildContext _) {
          return const DogImageScreen();
        },
        settings: RouteSettings(name: (DogImageScreen).toString()),
      ),
    );
  }

  void postsScreen() {
    _replace(
      materialPageRoute: MaterialPageRoute(
        builder: (final BuildContext _) {
          return const PostsScreen();
        },
        settings: RouteSettings(name: (PostsScreen).toString()),
      ),
    );
  }

  void savedImages() {
    _push(
      materialPageRoute: MaterialPageRoute(
        builder: (final BuildContext _) {
          return const SavedImagesScreen();
        },
        settings: RouteSettings(name: (SavedImagesScreen).toString()),
      ),
    );
  }

}