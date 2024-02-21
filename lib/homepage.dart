
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'consts.dart';
import 'model/article.dart';


class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  final Dio dio = Dio();

  List<Article> articles = [];
  static List sourcesId = [
    "abc-news",

    "bbc-news",
    "bbc-sport",

    "business-insider",

    "engadget",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",

    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",

    "medical-news-today",

    "national-geographic",

    "news24",
    "new-scientist",

    "new-york-magazine",
    "next-big-future",

    "techcrunch",
    "techradar",

    "the-hindu",

    "the-wall-street-journal",

    "the-washington-times",
    "time",
    "usa-today",

  ];


  @override
  void initState() {
    super.initState();
    _getNews();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        title: const Text(
          "Google News",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: Container(
          height: 100,
          width: size.width / 14,
          margin: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            color: Colors.yellow,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                "https://img.freepik.com/free-psd/3d-illustration-human-avatar-profile_23-2150671142.jpg?size=338&ext=jpg&ga=GA1.1.87170709.1707868800&semt=ais",
              ),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    final size = MediaQuery.of(context).size;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height/54,),
        Padding(
            padding: EdgeInsets.only(left: 24),
            child:  Text("Latest News :- ",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.black54),)),
        SizedBox(height: size.height/54,),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];
              return ListTile(
                onTap: () {
                  _launchUrl(
                    Uri.parse(article.url ?? ""),
                  );
                },
                leading: Image.network(
                  article.urlToImage ?? "",
                  height: 250,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  article.title ?? "",
                ),
                subtitle: Text(
                  article.publishedAt ?? "",
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> _getNews() async {
    final _random = new Random();
    var sourceID = sourcesId[_random.nextInt(sourcesId.length)];
    final response = await dio.get(
      'https://newsapi.org/v2/top-headlines?sources=$sourceID&apiKey=caea254bf2f94f869e831ec24284ece1',
    );
    final articlesJson = response.data["articles"] as List;
    setState(() {
      List<Article> newsArticle =
      articlesJson.map((a) => Article.fromJson(a)).toList();
      newsArticle = newsArticle.where((a) => a.title != "[Removed]").toList();
      articles = newsArticle;
    });
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
