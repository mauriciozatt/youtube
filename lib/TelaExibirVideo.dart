import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TelaExibirVideo extends StatefulWidget {
  String idVideo;

  TelaExibirVideo({Key? key, required this.idVideo}) : super(key: key);

  @override
  State<TelaExibirVideo> createState() => _TelaExibirVideoState();
}

class _TelaExibirVideoState extends State<TelaExibirVideo> {
  @override
  Widget build(BuildContext context) {


    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: widget.idVideo,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.black,

      body:
          Center(
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              onReady: () {

              },
            ),
          )

    );
  }
}
