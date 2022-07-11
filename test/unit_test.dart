import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pet_perfect/model/dog_image/dog_image.dart';
import 'package:pet_perfect/model/posts/post.dart';
import 'package:pet_perfect/services/api_requester.dart';

void main() {
  test("Testing the image load api", () async {
    Response response = await APIRequester.instance.dio.get('https://random.dog/woof.json');
    DogImage? dogImage = DogImage.fromMap(response.data);
    expect(dogImage, isNot(null));

    Response response1 =
        await APIRequester.instance.dio.get('http://jsonplaceholder.typicode.com/posts');
    List<Post>? posts = Post.listFromMap(response1.data);
    expect(posts.isNotEmpty, true);
  });

  test("Testing the posts load api", () async {
    Response response1 =
        await APIRequester.instance.dio.get('http://jsonplaceholder.typicode.com/posts');
    List<Post>? posts = Post.listFromMap(response1.data);
    expect(posts.isNotEmpty, true);
  });
}
