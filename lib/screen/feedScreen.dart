import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:webfeed/domain/rss_item.dart';

class FeedScreen extends StatelessWidget {
  RssItem feedItem;

  FeedScreen(this.feedItem);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  feedItem.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Html(
                data: feedItem.description,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
