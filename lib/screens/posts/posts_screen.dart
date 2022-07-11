import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_perfect/blocs/posts/posts_bloc.dart';
import 'package:pet_perfect/blocs/posts/posts_event.dart';
import 'package:pet_perfect/blocs/posts/posts_state.dart';
import 'package:pet_perfect/components/atoms/loading_atom.dart';
import 'package:pet_perfect/model/posts/post.dart';
import 'package:pet_perfect/services/pallete.dart';
import 'package:pet_perfect/services/wayfinder.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  late PostsBloc _postsBloc;

  @override
  void initState() {
    _postsBloc = PostsBloc();
    _postsBloc.add(LoadPosts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostsBloc>(
      create: (final BuildContext _) {
        return _postsBloc;
      },
      child: BlocBuilder<PostsBloc, PostsState>(
        builder: (
          final BuildContext _,
          final PostsState state,
        ) {
          return SafeArea(
            top: false,
            child: Scaffold(
              body: _body(state),
              appBar: AppBar(
                title: Text(
                  'Posts',
                  style: TextStyle(
                    color: Pallete.black,
                  ),
                ),
                backgroundColor: Pallete.white,
                actions: [
                  IconButton(
                    onPressed: () {
                      Wayfinder.instance.savedImages();
                    },
                    icon: Icon(
                      Icons.image,
                      color: Pallete.black,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _body(final PostsState state) {
    if (state is PostsLoading) {
      return LoadingAtom(
        onRefresh: () async {
          _postsBloc.add(LoadPosts());
        },
      );
    }

    if (_postsBloc.posts == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 32,
              color: Pallete.red,
            ),
            const Text('Unable to load posts!'),
          ],
        ),
      );
    }
    return ListView(
      children: [
        const SizedBox(
          height: 22,
        ),
        ..._postsBloc.posts!
            .map(
              (final Post post) => ListTile(
                title: Text(post.title ?? ''),
                subtitle: Text(post.body ?? ''),
              ),
            )
            .toList(),
        const SizedBox(
          height: 22,
        ),
      ],
    );
  }
}
