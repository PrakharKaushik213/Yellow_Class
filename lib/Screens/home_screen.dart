import 'package:flutter/material.dart';
import 'package:yelloclass/Widgets/custom_sliver_appbar.dart';
import 'package:provider/provider.dart';
import '../Provider/video_provider.dart';
import '../Widgets/video_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    triggerLoadinga();
    super.initState();
  }

  void triggerLoadinga() async {
    print("reached triggerloading");
    var provider = Provider.of<VideoProvider>(context, listen: false);
    await provider.loadData();
  }

  @override
  Widget build(BuildContext context) {
    print("build happening");
    var provider = Provider.of<VideoProvider>(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 60.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return VideoCard(video: provider.videos[index]);
                },
                childCount: provider.videos.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
