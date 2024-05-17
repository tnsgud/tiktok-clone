import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

final tabs = ['Top', 'Users', 'Videos', 'Sounds', 'LIVE', 'Shopping', 'Brands'];

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Discover'),
          bottom: TabBar(
            splashFactory: NoSplash.splashFactory,
            labelStyle: const TextStyle(fontWeight: FontWeight.w600),
            unselectedLabelColor: Colors.grey.shade500,
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            isScrollable: true,
            tabs: [
              for (var tab in tabs) Tab(text: tab),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            for (var tab in tabs)
              Center(
                child: Text(
                  tab,
                  style: const TextStyle(fontSize: 30),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
