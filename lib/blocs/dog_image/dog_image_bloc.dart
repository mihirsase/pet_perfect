import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_perfect/blocs/dog_image/dog_image_event.dart';
import 'package:pet_perfect/blocs/dog_image/dog_image_state.dart';
import 'package:pet_perfect/model/dog_image/dog_image.dart';
import 'package:pet_perfect/model/dog_image/dog_image_repo.dart';
import 'package:pet_perfect/services/wayfinder.dart';

class DogImageBloc extends Bloc<DogImageEvent, DogImageState> {
  DogImage? dogImage;

  DogImageBloc() : super(DogImageLoaded()) {
    on<LoadDogImage>(_onLoadDogImage);
    on<SaveDogImage>(_onSaveDogImage);
  }

  Future<void> _onLoadDogImage(LoadDogImage event, Emitter<DogImageState> emit) async {
    emit(DogImageLoading());

    DogImage? response = await DogImageRepo.instance.getDogImage();
    if (response != null) {
      dogImage = response;
    }
    emit(DogImageLoaded());
  }

  Future<void> _onSaveDogImage(SaveDogImage event, Emitter<DogImageState> emit) async {
    emit(DogImageLoading());

    Wayfinder.instance.postsScreen();
    emit(DogImageLoaded());
  }
}
