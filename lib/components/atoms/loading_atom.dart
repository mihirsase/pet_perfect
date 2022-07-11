import 'package:flutter/material.dart';
import 'package:pet_perfect/components/atoms/empty_atom.dart';
import 'package:pet_perfect/components/atoms/refresh_atom.dart';
import 'package:pet_perfect/services/pallete.dart';

class LoadingAtom extends StatelessWidget {
  final Future<void> Function()? onRefresh;

  const LoadingAtom({
    final this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    if (onRefresh != null) {
      return RefreshAtom(
        onRefresh: onRefresh!,
        child: EmptyAtom(
          child: CircularProgressIndicator(
            color: Pallete.green,
          ),
        ),
      );
    } else {
      return CircularProgressIndicator(
        color: Pallete.green,
      );
    }
  }
}
