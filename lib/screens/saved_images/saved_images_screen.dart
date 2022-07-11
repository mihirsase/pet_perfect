import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_perfect/blocs/saved_images/saved_images_bloc.dart';
import 'package:pet_perfect/blocs/saved_images/saved_images_event.dart';
import 'package:pet_perfect/blocs/saved_images/saved_images_state.dart';
import 'package:pet_perfect/components/atoms/loading_atom.dart';
import 'package:pet_perfect/model/dog_image/dog_image.dart';
import 'package:pet_perfect/services/pallete.dart';

class SavedImagesScreen extends StatefulWidget {
  const SavedImagesScreen({Key? key}) : super(key: key);

  @override
  State<SavedImagesScreen> createState() => _SavedImagesScreenState();
}

class _SavedImagesScreenState extends State<SavedImagesScreen> {
  late SavedImagesBloc _savedImagesBloc;

  @override
  void initState() {
    _savedImagesBloc = SavedImagesBloc();
    _savedImagesBloc.add(LoadSavedImages());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SavedImagesBloc>(
      create: (final BuildContext _) {
        return _savedImagesBloc;
      },
      child: BlocBuilder<SavedImagesBloc, SavedImagesState>(
        builder: (
          final BuildContext _,
          final SavedImagesState state,
        ) {
          return SafeArea(
            top: false,
            child: Scaffold(
              body: _body(state),
              appBar: AppBar(
                iconTheme: IconThemeData(
                  color: Pallete.black,
                ),
                title: Text(
                  'SavedImages',
                  style: TextStyle(
                    color: Pallete.black,
                  ),
                ),
                backgroundColor: Pallete.white,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _body(final SavedImagesState state) {
    if (state is SavedImagesLoading) {
      return LoadingAtom(
        onRefresh: () async {
          _savedImagesBloc.add(LoadSavedImages());
        },
      );
    }

    return ListView(
      children: [
        ..._savedImagesBloc.dogImages.map((final DogImage dogImage) => ListTile(
              title: Text(dogImage.url ?? ''),
            ))
      ],
    );
  }
}
