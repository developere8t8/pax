import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

class SamplePlayer extends StatefulWidget {
  final String playBackUrl;
  SamplePlayer({Key? key, required this.playBackUrl}) : super(key: key);

  @override
  _SamplePlayerState createState() => _SamplePlayerState();
}

class _SamplePlayerState extends State<SamplePlayer> {
  FlickManager? flickManager;
  @override
  void initState() {
    super.initState();
    flickManager =
        FlickManager(videoPlayerController: VideoPlayerController.network(widget.playBackUrl));
  }

  @override
  void dispose() {
    //controller.dispose();
    flickManager?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlickVideoPlayer(
        flickManager: flickManager!,
      ),
    );
  }
}

// class SamplePlayer extends StatefulWidget {
//   SamplePlayer({Key? key}) : super(key: key);

//   @override
//   _SamplePlayerState createState() => _SamplePlayerState();
// }

// class _SamplePlayerState extends State<SamplePlayer> {
//   late VideoPlayerController controller;
//   //FlickManager? flickManager;
//   @override
//   void initState() {
//     super.initState();
//     //if (Platform.isAndroid) WebView.platform = AndroidWebView();

//     controller = VideoPlayerController.network(
//         'https://dacastmmod-mmd-cust.lldns.net/90--1669057193--1669057313--911435e9897abd844a3d7e8ba5433c05/e2/d1775271-5c5c-05f9-823b-360c2831f93b/stream.ismd/manifest.m3u8?stream=source')
//       ..addListener(() => setState(() {}))
//       ..setLooping(true)
//       ..initialize().then((value) => controller.play());

//     // flickManager = FlickManager(
//     //     videoPlayerController: VideoPlayerController.network(
//     //         "https://dacastmmod-mmd-cust.lldns.net/90--1668631465--1668631585--3b5ce7dbf49d344ebd861c4852abd517/e2/0bf4726e-2ad2-652e-9aff-50ec0d4949ce/stream.ismd/manifest.m3u8?stream=e09388b3-3c47-617a-1043-f126a2f596ce_rendition%3Bd3a5aaa6-101f-9703-83cf-875821adc4a8_rendition"));
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     //flickManager?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child:
//           //     WebView(
//           //   allowsInlineMediaPlayback: true,
//           //   zoomEnabled: true,
//           //   initialUrl:
//           //       'https://iframe.dacast.com/vod/1ecff981-7b17-a72b-2fbc-5bcdffc609d1/0bf4726e-2ad2-652e-9aff-50ec0d4949ce',
//           //   javascriptMode: JavascriptMode.unrestricted,
//           // )
//           VideoPlayer(controller),
//       //     FlickVideoPlayer(
//       //   flickManager: flickManager!,
//       // ),
//     );
//   }
// }

