import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_perfect/blocs/dog_image/dog_image_bloc.dart';
import 'package:pet_perfect/blocs/dog_image/dog_image_event.dart';
import 'package:pet_perfect/blocs/dog_image/dog_image_state.dart';
import 'package:pet_perfect/components/atoms/loading_atom.dart';
import 'package:pet_perfect/services/pallete.dart';

class DogImageScreen extends StatefulWidget {
  const DogImageScreen({Key? key}) : super(key: key);

  @override
  State<DogImageScreen> createState() => _DogImageScreenState();
}

class _DogImageScreenState extends State<DogImageScreen> {
  late DogImageBloc _dogImageBloc;

  @override
  void initState() {
    _dogImageBloc = DogImageBloc();
    _dogImageBloc.add(LoadDogImage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DogImageBloc>(
      create: (final BuildContext _) {
        return _dogImageBloc;
      },
      child: BlocBuilder<DogImageBloc, DogImageState>(
        builder: (
          final BuildContext _,
          final DogImageState state,
        ) {
          return SafeArea(
            top: false,
            child: Scaffold(
              body: _body(state),
              floatingActionButton: state is DogImageLoaded && _dogImageBloc.dogImage?.url != null
                  ? FloatingActionButton(
                      onPressed: () {
                        _dogImageBloc.add(SaveDogImage());
                      },
                      child: const Icon(Icons.navigate_next),
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }

  Widget _body(final DogImageState state) {
    if (state is DogImageLoading) {
      return LoadingAtom(
        onRefresh: () async {
          _dogImageBloc.add(LoadDogImage());
        },
      );
    }

    if (_dogImageBloc.dogImage?.url == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 32,
              color: Pallete.red,
            ),
            const Text('Unable to load the image!'),
          ],
        ),
      );
    }

    return Center(
      child: Image.network(
        _dogImageBloc.dogImage!.url!,
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return const LoadingAtom();
        },
        height: MediaQuery.of(context).size.height * 0.5,
      ),
    );
  }
}
