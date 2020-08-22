import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;

class FeedNetworking {
  Future<RssFeed> searchFeed() async {
    var url = 'https://www.aviationwiki.net/feeds/posts/default?alt=rss';
    // https://www.gamespot.com/feeds/mashup/
// https://www.aviationwiki.net/feeds/posts/default?alt=rss
    var response = await http.get(url);
    if (response == null) return null;

    switch (response.statusCode) {
      case 200:
        return RssFeed.parse(response.body);
      default:
        throw Exception('Failed to getAvailableFees');
    }
  }
}
