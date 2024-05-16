import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/videos/widgets/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  final PageController _pageController = PageController();
  final _scrollDuration = const Duration(milliseconds: 200);
  final _scrollCurve = Curves.linear;
  int _itemCount = 4;
  List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.teal,
  ];

  void _onPageChanged(int page) {
    _pageController.animateToPage(
      page,
      duration: _scrollDuration,
      curve: _scrollCurve,
    );

    if (page == _itemCount - 1) {
      setState(() {
        _itemCount += 4;
      });
    }
  }

  void _onVideoFinished() {
    return;
  }

  Future<void> _onRefresh() {
    return Future.delayed(const Duration(seconds: 4));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      edgeOffset: 20,
      displacement: 50,
      color: Theme.of(context).primaryColor,
      child: PageView.builder(
        controller: _pageController,
        itemCount: _itemCount,
        scrollDirection: Axis.vertical,
        onPageChanged: _onPageChanged,
        itemBuilder: (context, index) => VideoPost(
          index: index,
          onVideoFinished: _onVideoFinished,
        ),
      ),
    );
  }
}
