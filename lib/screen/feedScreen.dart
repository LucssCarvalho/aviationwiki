import 'package:flutter/material.dart';
import 'package:webfeed/domain/rss_item.dart';

class FeedScreen extends StatelessWidget {
  RssItem feedItem;

  FeedScreen(this.feedItem);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.amber[200],
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(feedItem.title),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
