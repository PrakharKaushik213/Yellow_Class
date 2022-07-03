import 'package:flutter/material.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:yelloclass/Widgets/bottom_nav.dart';
import 'package:yelloclass/Widgets/custom_sliver_appbar.dart';
import 'package:provider/provider.dart';
import '../Provider/video_provider.dart';
import '../Widgets/video_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController? scrollController;
  IsInViewPortCondition? inViewPortCondition;
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
    final IsInViewPortCondition condition = inViewPortCondition ??
        (double deltaTop, double deltaBottom, double vpHeight) {
          return deltaTop < (0.25 * vpHeight) &&
              deltaBottom > (0.35 * vpHeight);
        };
    print("build happening");
    var provider = Provider.of<VideoProvider>(context);
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      bottomNavigationBar: bottomNav(),
      body: InViewNotifierCustomScrollView(
        initialInViewIds: ['1'],
        isInViewPortCondition: condition,
        controller: scrollController,
        slivers: [
          CustomSliverAppBar(),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 60.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      child: VideoCard(video: provider.videos[index]));
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
