import 'package:flutter/material.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:video_player/video_player.dart';
import 'package:yelloclass/Widgets/video_player.dart';

import '../Models/Video.dart';

class VideoCard extends StatefulWidget {
  final Video video;
  final bool hasPadding;

  const VideoCard({
    Key? key,
    required this.video,
    this.hasPadding = false,
  }) : super(key: key);

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  bool isPlaying = true;
  bool isTapped = false;
  VideoPlayerController? _controller;
  playVideoScreen(String url) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Videoplayer(url: url)));
  }

  onTapVideoInit() {
    final controller = VideoPlayerController.network(widget.video.videoUrl);
    setState(() {
      _controller = controller;
    });
    _controller!.initialize().then((value) {
      // controller.addListener(playPause);
      // controller.play();
      setState(() {});
    });
  }

  Widget miniVideoPlayer() {
    final aspect = _controller!.value.aspectRatio;
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: aspect,
        child: VideoPlayer(controller),
      );
    } else {
      return AspectRatio(
        aspectRatio: aspect,
        child: const Center(child: CircularProgressIndicator()),
      );
    }
  }

  void playPause(bool isPlaying) {
    final controller = _controller;
    if (controller == null) {
      return;
    }
    if (!controller.value.isInitialized) {
      return;
    }
    if (isPlaying) {
      setState(() {
        isTapped = true;
      });
    } else {
      controller.pause();
    }
  }

  bool isInit = true;
  @override
  // void initState() {
  //   print("id is ${widget.video.id} is initialized");
  //   onTapVideoInit();
  //   super.initState();
  // }
  void didChangeDependencies() {
    onTapVideoInit();
    print("id is initialized :${widget.video.id}");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return InViewNotifierWidget(
      id: widget.video.id.toString(),
      builder: (BuildContext context, bool isInView, Widget? child) {
        print("id is : ${widget.video.id.toString()} it is $isInView");
        if (isInView) {
          isTapped = true;
          _controller!.play();
        } else {
          print("id is in the else part of ${widget.video.id}");
          isTapped = false;
          _controller!.pause();
        }
        return Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: GestureDetector(
            // onDoubleTap: () {
            //   setState(() {
            //     isTapped = false;
            //     _controller!.pause();
            //   });
            // },
            // onTap: () {
            //   onTapVideoInit();
            //   setState(() {
            //     isTapped = true;
            //   });
            // },
            onLongPress: () {
              playVideoScreen(widget.video.videoUrl);
            },
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: widget.hasPadding ? 12.0 : 0,
                      ),
                      child: isTapped
                          ? miniVideoPlayer()
                          : Image.network(
                              widget.video.coverPicture,
                              height: 220.0,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                    ),
                    Positioned(
                      bottom: 8.0,
                      right: widget.hasPadding ? 20.0 : 8.0,
                      child: Container(
                        padding: const EdgeInsets.all(4.0),
                        color: Colors.black,
                        child: Text(
                          widget.video.id,
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => print('Profile Icon tapped'),
                        child: CircleAvatar(
                          foregroundImage:
                              NetworkImage(widget.video.coverPicture),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text(
                                widget.video.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 15.0),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                'Id : ${widget.video.id} • Class : ${widget.video.id}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(fontSize: 14.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: isTapped
                              ? const Icon(Icons.pause, size: 20.0)
                              : Icon(Icons.play_arrow, size: 20.0)),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
