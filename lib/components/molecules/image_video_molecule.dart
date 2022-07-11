import 'package:flutter/material.dart';
import 'package:pet_perfect/components/atoms/loading_atom.dart';
import 'package:video_player/video_player.dart';

class ImageVideoMolecule extends StatefulWidget {
  final String url;

  const ImageVideoMolecule({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  State<ImageVideoMolecule> createState() => _ImageVideoMoleculeState();
}

class _ImageVideoMoleculeState extends State<ImageVideoMolecule> {

  bool _isVideo = false;
  late VideoPlayerController _controller;

  @override
  void initState() {
    if (widget.url.contains('mp4')) {
      _isVideo = true;
      _controller = VideoPlayerController.network(
          widget.url)
        ..initialize().then((_) {
          setState(() {});
          _controller.play();
        });
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isVideo) {
      return _controller.value.isInitialized
          ? AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: VideoPlayer(_controller),
      )
          : Container();
    } else {
      return Image.network(
        widget.url,
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return const LoadingAtom();
        },
        height: MediaQuery
            .of(context)
            .size
            .height * 0.5,
      );
    }
  }
}
