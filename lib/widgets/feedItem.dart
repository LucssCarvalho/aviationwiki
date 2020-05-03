import 'package:aviationwiki/screen/feedScreen.dart';
import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FeedItem extends StatelessWidget {
  final RssItem feedItem;

  FeedItem(this.feedItem);
  static const String placeholderImg = 'assets/images/no_img.png';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => FeedScreen(feedItem),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: thumbnail(feedItem.media.thumbnails.first.url),
            title: Text(feedItem.title),
          ),
        ),
      ),
    );
  }

  thumbnail(String imageUrl) {
    return CachedNetworkImage(
        placeholder: (context, url) => Image.asset(placeholderImg),
        imageUrl: imageUrl,
        height: 100,
        width: 100,
        alignment: Alignment.center,
        fit: BoxFit.fill);
  }
}
