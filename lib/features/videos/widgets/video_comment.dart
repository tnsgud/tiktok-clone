import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class VideoComment extends StatefulWidget {
  const VideoComment({super.key});

  @override
  State<VideoComment> createState() => _VideoCommentState();
}

class _VideoCommentState extends State<VideoComment> {
  bool _isWriting = false;
  final ScrollController _scrollController = ScrollController();

  void _onClosePressed() {
    Navigator.of(context).pop();
  }

  void _onBodyTap() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  void _onStartWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.75,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size14),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          automaticallyImplyLeading: false,
          title: const Text('22796 comments'),
          actions: [
            IconButton(
              onPressed: _onClosePressed,
              icon: const FaIcon(FontAwesomeIcons.xmark),
            )
          ],
        ),
        body: GestureDetector(
          onTap: _onBodyTap,
          child: Stack(children: [
            Scrollbar(
              controller: _scrollController,
              child: ListView.separated(
                controller: _scrollController,
                padding: const EdgeInsets.only(
                  left: Sizes.size16,
                  right: Sizes.size16,
                  top: Sizes.size10,
                  bottom: Sizes.size96 + Sizes.size20,
                ),
                itemCount: 10,
                separatorBuilder: (context, index) => Gaps.v20,
                itemBuilder: (context, index) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 18,
                      child: Text('Sn'),
                    ),
                    Gaps.h10,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Soon',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Sizes.size14,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          Gaps.v3,
                          const Text(
                              "That's not it l've seen the same thing but also in a cave")
                        ],
                      ),
                    ),
                    Gaps.h10,
                    Column(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.heart,
                          size: Sizes.size20,
                          color: Colors.grey.shade500,
                        ),
                        Gaps.v2,
                        Text(
                          '52.2K',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              width: size.width,
              bottom: 0,
              child: BottomAppBar(
                surfaceTintColor: Colors.white,
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 18,
                      child: Text('Sn'),
                    ),
                    Gaps.h10,
                    Expanded(
                      child: TextField(
                        onTap: _onStartWriting,
                        expands: true,
                        minLines: null,
                        maxLines: null,
                        textInputAction: TextInputAction.newline,
                        cursorColor: Theme.of(context).primaryColor,
                        decoration: InputDecoration(
                          hintText: 'tewtettttetetete',
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: Sizes.size14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.at,
                                  color: Colors.grey.shade900,
                                ),
                                Gaps.h14,
                                FaIcon(
                                  FontAwesomeIcons.gift,
                                  color: Colors.grey.shade900,
                                ),
                                Gaps.h14,
                                FaIcon(
                                  FontAwesomeIcons.faceSmile,
                                  color: Colors.grey.shade900,
                                ),
                                Gaps.h14,
                                if (_isWriting)
                                  FaIcon(
                                    FontAwesomeIcons.circleArrowUp,
                                    color: Theme.of(context).primaryColor,
                                  ),
                              ],
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Sizes.size12),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: Sizes.size12,
                            horizontal: Sizes.size10,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
