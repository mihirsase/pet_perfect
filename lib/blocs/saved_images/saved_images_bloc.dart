import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pet_perfect/blocs/saved_images/saved_images_event.dart';
import 'package:pet_perfect/blocs/saved_images/saved_images_state.dart';
import 'package:pet_perfect/model/dog_image/dog_image.dart';

class SavedImagesBloc extends Bloc<SavedImagesEvent, SavedImagesState> {
  List<DogImage> dogImages = [];

  SavedImagesBloc() : super(SavedImagesLoaded()) {
    on<LoadSavedImages>(_onLoadSavedImages);
  }

  Future<void> _onLoadSavedImages(LoadSavedImages event, Emitter<SavedImagesState> emit) async {
    emit(SavedImagesLoading());
    var box = await Hive.openBox('PetPerfectBox');
    print(box.toMap());

    for (int i = 0; i < box.length; i++) {
      dogImages.add(
          DogImage(fileSizeBytes: box.get(i + 1)['fileSizeBytes'], url: box.get(i + 1)['url']));
    }
    emit(SavedImagesLoaded());
  }
}
