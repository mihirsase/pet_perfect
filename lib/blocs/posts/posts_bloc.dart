import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_perfect/blocs/posts/posts_event.dart';
import 'package:pet_perfect/blocs/posts/posts_state.dart';
import 'package:pet_perfect/model/posts/post.dart';
import 'package:pet_perfect/model/posts/post_repo.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  List<Post>? posts;

  PostsBloc() : super(PostsLoaded()) {
    on<LoadPosts>(_onLoadPosts);
  }

  Future<void> _onLoadPosts(LoadPosts event, Emitter<PostsState> emit) async {
    emit(PostsLoading());

    List<Post>? response = await PostRepo.instance.getPosts();
    if (response != null) {
      posts = response;
    }
    emit(PostsLoaded());
  }
}
