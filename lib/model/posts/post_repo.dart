import 'package:dio/dio.dart';
import 'package:pet_perfect/model/posts/post.dart';
import 'package:pet_perfect/services/api_requester.dart';

class PostRepo {
  static final PostRepo instance = PostRepo._();

  PostRepo._();

  Future<List<Post>?> getPosts() async {
    try {
      Response response = await APIRequester.instance.dio.get('http://jsonplaceholder.typicode.com/posts');
      return Post.listFromMap(response.data);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
