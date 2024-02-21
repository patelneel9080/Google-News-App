import 'package:flutter/material.dart';
import 'package:news_snack/view/detail_view.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsContainer extends StatelessWidget {
  String imgUrl;
  String newsHead;
  String newsDes;
  String newsUrl;
  String newsCnt;

  NewsContainer(
      {super.key,
      required this.imgUrl,
      required this.newsDes,
      required this.newsCnt,
      required this.newsHead,
      required this.newsUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
          child: FadeInImage.assetNetwork(
            height: size.height / 3,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            placeholder: "assets/img/placeholder.jfif",
            image: imgUrl,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: size.height / 34,
            ),
            Text(
              newsHead.length > 90 ? "${newsHead.substring(0, 90)}..." : newsHead,
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height / 34,
            ),
            Text(
              newsDes,
              style: TextStyle(fontSize: 12, color: Colors.black38),
            ),
            SizedBox(
              height: size.height / 34,
            ),
            Text(
              newsCnt != "Loading..."
                  ? newsCnt.length > 250
                      ? newsCnt.substring(0, 250)
                      : "${newsCnt.toString().substring(0, newsCnt.length - 15)}..."
                  : newsCnt,
              style: TextStyle(fontSize: 16),
            ),
          ]),
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailViewScreen(newsUrl: newsUrl)));
                  },
                  child: Text("Read More")),
            ),
          ],
        ),
        SizedBox(
          height: size.height / 34,
        )
      ]),
    );
  }
}
