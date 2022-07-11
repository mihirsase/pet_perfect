import 'package:dio/dio.dart';
import 'package:pet_perfect/model/dog_image/dog_image.dart';
import 'package:pet_perfect/services/api_requester.dart';

class DogImageRepo {
  static final DogImageRepo instance = DogImageRepo._();

  DogImageRepo._();

  Future<DogImage?> getDogImage() async {
    try {
      Response response = await APIRequester.instance.dio.get('https://random.dog/woof.json');
      return DogImage.fromMap(response.data);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
