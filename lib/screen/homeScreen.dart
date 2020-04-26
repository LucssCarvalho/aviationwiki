import 'package:aviationwiki/networking/feed_Networking.dart';
import 'package:aviationwiki/widgets/feedItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:webfeed/webfeed.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<RssFeed> _rssFeedFuture;

  @override
  void initState() {
    super.initState();
    _checkFeed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(27, 28, 39, 1.0),
        title: Container(
          height: 70,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.contain),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.blueGrey[100],
        child: Column(
          children: <Widget>[
            listFeed(),
          ],
        ),
      ),
    );
  }

  Widget _createTitle() {
    return Container(
      color: Color.fromRGBO(242, 177, 37, 1.0),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 15.0, right: 10.0, top: 10.0, bottom: 10.0),
        child: Text(
          'NOTÍCIAS RECENTES',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  Widget listFeed() {
    return FutureBuilder<RssFeed>(
      future: _rssFeedFuture,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Center(child: CircularProgressIndicator()),
            );
          default:
            if (snapshot.hasError) {
              return new Text('Error: ${snapshot.error}');
            } else {
              var feeds =
                  snapshot.data.items.map((feed) => FeedItem(feed)).toList();

              if (feeds == null) {
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: new Text('Nenhuma noticia encontrada'),
                ));
              }

              return Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: <Widget>[
                    _createTitle(),
                    ...feeds,
                  ],
                ),
              );
            }
        }
      },
    );
  }

  _checkFeed() {
    setState(() {
      _rssFeedFuture = FeedNetworking().searchFeed();
    });
  }
}
